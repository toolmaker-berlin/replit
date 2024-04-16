# https://stackoverflow.com/questions/60806139/system-signal-interception-in-julia

print("\033c") # cls

println("Terminal: $(displaysize(stdout))")
function monitor_term(func)
    @async begin 
        curr_size = displaysize(stdout)
        while (true)
            sleep(0.1)
            new_size = displaysize(stdout)
            if new_size != curr_size
                curr_size = new_size
                func()
            end
        end
    end
end
monitor_term(() -> print("\nGeaendert: $(displaysize(stdout))"))

macro cleanbreak(ex)
   quote
       try
           $(esc(ex))
       catch e
           if e isa InterruptException
               @warn "Computation interrupted"
           else
               rethrow()
           end   
       end
   end 
end

# @cleanbreak while true sleep(1000) end

while true
  sleep(1000)
end