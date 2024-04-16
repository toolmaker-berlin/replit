print("\033c") # cls

println("Input Int per 'readline()' :")

user_input = readline()
number = parse(Int, user_input)

println("Zahl eingegeben: $number")

