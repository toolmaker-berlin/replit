module EchoREPL

import REPL
import REPL.LineEdit

do_cmd(repl, input) = println(REPL.outstream(repl), input)

function create_mode(repl, main_mode)
    echo_mode = LineEdit.Prompt("echo> ";
        prompt_prefix = Base.text_colors[:cyan],
        prompt_suffix = "",
        # complete = nothing,
        sticky = false)
    echo_mode.repl = repl
    hp = main_mode.hist
    hp.mode_mapping[:echo] = echo_mode
    echo_mode.hist = hp

    search_prompt, skeymap = LineEdit.setup_search_keymap(hp)
    prefix_prompt, prefix_keymap = LineEdit.setup_prefix_keymap(hp, echo_mode)

    echo_mode.on_done = (s, buf, ok) -> begin
        ok || return REPL.transition(s, :abort)
        input = String(take!(buf))
        REPL.reset(repl)
        do_cmd(repl, input)
        REPL.prepare_next(repl)
        REPL.reset_state(s)
        s.current_mode.sticky || REPL.transition(s, main_mode)
    end

    mk = REPL.mode_keymap(main_mode)

    # shell_mode = nothing
    # for mode in Base.active_repl.interface.modes
    #     if mode isa LineEdit.Prompt
    #         mode.prompt == "shell> " && (shell_mode = mode)
    #     end
    # end

    # repl_keymap = Dict()
    # if shell_mode != nothing
    #     repl_keymap[';'] = function (s, o...)
    #         if isempty(s) || position(LineEdit.buffer(s)) == 0
    #             buf = copy(LineEdit.buffer(s))
    #             LineEdit.transition(s, shell_mode) do
    #                 LineEdit.state(s, shell_mode).input_buffer = buf
    #             end
    #         else
    #             LineEdit.edit_insert(s, ';')
    #         end
    #     end
    # end

    b = Dict{Any, Any}[
        skeymap, #=repl_keymap,=# mk, prefix_keymap, LineEdit.history_keymap,
        LineEdit.default_keymap, LineEdit.escape_defaults
    ]
    echo_mode.keymap_dict = LineEdit.keymap(b)
    return echo_mode
end

function repl_init(repl)
    main_mode = repl.interface.modes[1]
    echo_mode = create_mode(repl, main_mode)
    push!(repl.interface.modes, echo_mode)
    org_action = main_mode.keymap_dict['\x01']
    keymap = Dict{Any, Any}(
        # "^A" => function (s, args...)
        '\x01' => function (s, args...)
            # println("^A")
            if isempty(s) || position(LineEdit.buffer(s)) == 0
                buf = copy(LineEdit.buffer(s))
                LineEdit.transition(s, echo_mode) do
                    LineEdit.state(s, echo_mode).input_buffer = buf
                end
            else
                # LineEdit.edit_insert(s, ']')
                org_action(s, args...)
            end
        end
    )
    main_mode.keymap_dict = LineEdit.keymap_merge(main_mode.keymap_dict, keymap)
    return
end

function __init__()
    if isdefined(Base, :active_repl)
        repl_init(Base.active_repl)
    else
        atreplinit() do repl
            if isinteractive() && repl isa REPL.LineEditREPL
                isdefined(repl, :interface) || (repl.interface = REPL.setup_interface(repl))
                repl_init(repl)
            end
        end
    end
end

end # module
