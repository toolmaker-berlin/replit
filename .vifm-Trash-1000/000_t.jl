import InteractiveUtils

function detect_terminal_size_change()
    prev_width = InteractiveUtils.terminalwidth()
    while true
        current_width = InteractiveUtils.terminalwidth()
        if current_width != prev_width
            println("Terminal size has changed!")
            println("Previous width: $prev_width, Current width: $current_width")
            prev_width = current_width
        end
        # You can adjust the frequency of checking here using sleep()
        sleep(1)  # Check every second
    end
end

# Call the function to start detecting terminal size changes
detect_terminal_size_change()
