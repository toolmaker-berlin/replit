Stand 13. März 2024 (dürftig)

# Tmux

```
tmux kill-session
```

# Aliase 

```
TMUX
TLS
TA
TD
TKILL
...usw.
```

# Tastatur-Kürzel

```
c-b (präfix)
% 
“ 
: 
?  
<up/down/left/right>
```

# Tmux config

```
https://github.com/tmux-plugins/list

tpm tmux plugin manager 
muss zuerst installiert sein:

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

type this in terminal if tmux is already running:

tmux source ~/.tmux.conf
```

# Datei '.tmux.conf'

```
xxx tmux-autoreload
set-option -g @plugin 'b0o/tmux-autoreload' erspart c-b I reload config.

tmux-sensible standart einstellungen

tmux-sidebar dir tree (obsolet?)
Key bindings:
prefix + Tab - toggle sidebar with a directory tree
prefix + Backspace - toggle sidebar and move cursor to it (focus it)

tmux-resurrect Persists tmux -> continuum
(c-b c-s und c-b c-l)

tmux sessionist utils für sessions (nett zukunft)
tmux continuum sichert env, auto restore autostart tmux bei neustart

Hit prefix + I oder eher i fetch the plugin and source it. You should now be able to use the plugin.
Uninstalling plugins

Remove (or comment out) plugin from the list.
Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.
```

cat .tmux.conf

```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-sidebar'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-sessionist'
set -g @plugin 'b0o/tmux-autoreload' erspart c-b I reload config.


set -g @plugin 'tmux-plugins/tmux-continuum' #### letztes PlugIn


# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

set -g @sidebar-tree-command 'exa -1 --colour=auto --sort extension'
set -g @sidebar-tree-width '50'

set -g @continuum-restore 'on'
set -g @continuum-boot-options 'iterm'
set -g @continuum-save-interval '10'
set -g status-right 'Continuum: #{continuum_status}'

# for vim
set -g @resurrect-strategy-vim 'session'
# for neovim
set -g @resurrect-strategy-nvim 'session'
set -g @resurrect-capture-pane-contents 'on'



set-option status-style bg=blue,fg=white
set-option -sg escape-time 10 ### was ist mit sensible?
set-window-option -g xterm-keys on
set -g default-terminal screen-256color
set -g mouse on

run-shell ~/.tmux/Plugins/tmux-continuum/continuum.tmux
run-shell ~/.tmux/plugins/tmux-sensible/sensible.tmux
```

# Tree '.tmux'

```
.tmux
├── plugins
│   ├── tmux-continuum
│   │   ├── CHANGELOG.md
│   │   ├── CONTRIBUTING.md
│   │   ├── LICENSE.md
│   │   ├── README.md
│   │   ├── continuum.tmux
│   │   ├── docs
│   │   │   ├── automatic_start.md
│   │   │   ├── continuum_status.md
│   │   │   ├── faq.md
│   │   │   ├── multiple_tmux_servers.md
│   │   │   └── systemd_details.md
│   │   └── scripts
│   │       ├── check_tmux_version.sh
│   │       ├── continuum_restore.sh
│   │       ├── continuum_save.sh
│   │       ├── continuum_status.sh
│   │       ├── handle_tmux_automatic_start
│   │       │   ├── README.md -> ../../docs/automatic_start.md
│   │       │   ├── osx_alacritty_start_tmux.sh
│   │       │   ├── osx_disable.sh
│   │       │   ├── osx_enable.sh
│   │       │   ├── osx_iterm_start_tmux.sh
│   │       │   ├── osx_kitty_start_tmux.sh
│   │       │   ├── osx_terminal_start_tmux.sh
│   │       │   ├── systemd_disable.sh
│   │       │   └── systemd_enable.sh
│   │       ├── handle_tmux_automatic_start.sh
│   │       ├── helpers.sh
│   │       ├── shared.sh
│   │       └── variables.sh
│   ├── tmux-resurrect
│   │   ├── CHANGELOG.md
│   │   ├── CONTRIBUTING.md
│   │   ├── LICENSE.md
│   │   ├── README.md
│   │   ├── docs
│   │   │   ├── custom_key_bindings.md
│   │   │   ├── hooks.md
│   │   │   ├── migrating_from_tmuxinator.md
│   │   │   ├── restoring_pane_contents.md
│   │   │   ├── restoring_programs.md
│   │   │   ├── restoring_shell_history.md
│   │   │   ├── restoring_vim_and_neovim_sessions.md
│   │   │   └── save_dir.md
│   │   ├── lib
│   │   │   └── tmux-test
│   │   │       ├── CHANGELOG.md
│   │   │       ├── LICENSE.md
│   │   │       ├── README.md
│   │   │       ├── Vagrantfile
│   │   │       ├── run_framework_tests
│   │   │       ├── run_tests
│   │   │       ├── setup
│   │   │       ├── tests
│   │   │       │   ├── helpers
│   │   │       │   │   └── helpers.sh
│   │   │       │   ├── run_tests_in_isolation
│   │   │       │   ├── test_basic_script_execution.sh
│   │   │       │   ├── test_default_session_name.sh
│   │   │       │   └── test_tmux_scripting.sh
│   │   │       ├── vagrant_centos_provisioning.sh
│   │   │       └── vagrant_ubuntu_provisioning.sh
│   │   ├── resurrect.tmux
│   │   ├── run_tests -> lib/tmux-test/run_tests
│   │   ├── save_command_strategies
│   │   │   ├── gdb.sh
│   │   │   ├── linux_procfs.sh
│   │   │   ├── pgrep.sh
│   │   │   └── ps.sh
│   │   ├── scripts
│   │   │   ├── check_tmux_version.sh
│   │   │   ├── helpers.sh
│   │   │   ├── process_restore_helpers.sh
│   │   │   ├── restore.exp
│   │   │   ├── restore.sh
│   │   │   ├── save.sh
│   │   │   ├── spinner_helpers.sh
│   │   │   ├── tmux_spinner.sh
│   │   │   └── variables.sh
│   │   ├── strategies
│   │   │   ├── irb_default_strategy.sh
│   │   │   ├── mosh-client_default_strategy.sh
│   │   │   ├── nvim_session.sh
│   │   │   └── vim_session.sh
│   │   ├── tests
│   │   │   ├── fixtures
│   │   │   │   ├── restore_file.txt
│   │   │   │   └── save_file.txt
│   │   │   ├── helpers
│   │   │   │   ├── create_and_save_tmux_test_environment.exp
│   │   │   │   ├── expect_helpers.exp
│   │   │   │   ├── helpers.sh -> ../../lib/tmux-test/tests/helpers/helpers.sh
│   │   │   │   ├── restore_and_save_tmux_test_environment.exp
│   │   │   │   └── resurrect_helpers.sh
│   │   │   ├── run_tests_in_isolation -> ../lib/tmux-test/tests/run_tests_in_isolation
│   │   │   ├── test_resurrect_restore.sh
│   │   │   └── test_resurrect_save.sh
│   │   └── video
│   │       ├── issue_vid.png
│   │       ├── screencast_img.png
│   │       └── script.md
│   ├── tmux-sensible
│   │   ├── CHANGELOG.md
│   │   ├── LICENSE.md
│   │   ├── README.md
│   │   └── sensible.tmux
│   ├── tmux-sessionist
│   │   ├── CHANGELOG.md
│   │   ├── LICENSE.md
│   │   ├── README.md
│   │   ├── screenshots
│   │   │   ├── gif_source.pdf
│   │   │   ├── sessions_list.png
│   │   │   └── tmux_goto_session.gif
│   │   ├── scripts
│   │   │   ├── goto_session.sh
│   │   │   ├── helpers.sh
│   │   │   ├── join_pane.sh
│   │   │   ├── kill_session.sh
│   │   │   ├── kill_session_prompt.sh
│   │   │   ├── list_sessions.sh
│   │   │   ├── new_session.sh
│   │   │   ├── new_session_prompt.sh
│   │   │   ├── promote_pane.sh
│   │   │   └── switch_or_loop.sh
│   │   └── sessionist.tmux
│   ├── tmux-sidebar
│   │   ├── CHANGELOG.md
│   │   ├── LICENSE.md
│   │   ├── README.md
│   │   ├── docs
│   │   │   └── options.md
│   │   ├── screenshot.gif
│   │   ├── scripts
│   │   │   ├── check_tmux_version.sh
│   │   │   ├── custom_tree.sh
│   │   │   ├── helpers.sh
│   │   │   ├── save_sidebar_width.sh
│   │   │   ├── toggle.sh
│   │   │   ├── tree_helpers.sh
│   │   │   └── variables.sh
│   │   └── sidebar.tmux
│   └── tpm
│       ├── CHANGELOG.md
│       ├── HOW_TO_PLUGIN.md
│       ├── LICENSE.md
│       ├── README.md
│       ├── bin
│       │   ├── clean_plugins
│       │   ├── install_plugins
│       │   └── update_plugins
│       ├── bindings
│       │   ├── clean_plugins
│       │   ├── install_plugins
│       │   └── update_plugins
│       ├── docs
│       │   ├── automatic_tpm_installation.md
│       │   ├── changing_plugins_install_dir.md
│       │   ├── how_to_create_plugin.md
│       │   ├── managing_plugins_via_cmd_line.md
│       │   └── tpm_not_working.md
│       ├── lib
│       │   └── tmux-test
│       ├── scripts
│       │   ├── check_tmux_version.sh
│       │   ├── clean_plugins.sh
│       │   ├── helpers
│       │   │   ├── plugin_functions.sh
│       │   │   ├── shell_echo_functions.sh
│       │   │   ├── tmux_echo_functions.sh
│       │   │   ├── tmux_utils.sh
│       │   │   └── utility.sh
│       │   ├── install_plugins.sh
│       │   ├── source_plugins.sh
│       │   ├── update_plugin.sh
│       │   ├── update_plugin_prompt_handler.sh
│       │   └── variables.sh
│       ├── tests
│       │   ├── expect_failed_plugin_download
│       │   ├── expect_successful_clean_plugins
│       │   ├── expect_successful_multiple_plugins_download
│       │   ├── expect_successful_plugin_download
│       │   ├── expect_successful_update_of_a_single_plugin
│       │   ├── expect_successful_update_of_all_plugins
│       │   ├── helpers
│       │   │   └── tpm.sh
│       │   ├── test_plugin_clean.sh
│       │   ├── test_plugin_installation.sh
│       │   ├── test_plugin_installation_legacy.sh
│       │   ├── test_plugin_sourcing.sh
│       │   └── test_plugin_update.sh
│       └── tpm
├── resurrect
│   ├── last -> tmux_resurrect_20220503T212015.txt
│   ├── pane_contents.tar.gz
│   ├── restore
│   │   └── pane_contents
│   ├── save
│   │   └── pane_contents
│   ├── tmux_resurrect_20220503T110115.txt
│   ├── tmux_resurrect_20220503T125250.txt
│   ├── tmux_resurrect_20220503T145112.txt
│   ├── tmux_resurrect_20220503T145337.txt
│   ├── tmux_resurrect_20220503T152138.txt
│   ├── tmux_resurrect_20220503T152256.txt
│   ├── tmux_resurrect_20220503T152856.txt
│   ├── tmux_resurrect_20220503T155811.txt
│   ├── tmux_resurrect_20220503T160344.txt
│   ├── tmux_resurrect_20220503T202958.txt
│   ├── tmux_resurrect_20220503T204718.txt
│   ├── tmux_resurrect_20220503T211326.txt
│   └── tmux_resurrect_20220503T212015.txt
└── sidebar
    └── directory_widths.txt
```

