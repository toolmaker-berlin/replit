# Write binary file
function write_bin(x::Array{T, 1}, fileName::String)::Int64 where T
  
  # Open the file
  io = open(fileName,"w")
  
  # Cast this number to make sure we know its type
  write(io, Int64(size(x)[1]))

  # Get the type as a string
  typ = repr(T)
  # Write the length of the type string
  write(io, Int64(length(typ)))

  # Now write the type string
  for i in eachindex(typ)
  	write(io, Char(typ[i]))
  end
  
  # Now write the array
  for i in eachindex(x)
      write(io, x[i])
  end
  
  # Clean up
  close(io)
  
  return 0;
end

# Read binary file
# Sub Function which speeds up the read
function read_bin(io::IO, ::Type{T}, n::Int64) where T

  # The array to be returned
  x = Array{T, 1}(undef, n)

  @time for i in eachindex(x)
    x[i] = read(io, T)
  end

  close(io)

  return x
end

# The read function
function read_bin(fileName::String)

	# Open the file
  io = open(fileName, "r")

  # Read the total number of elements in the resulting array
  n = read(io, Int64)
  # Read the length of the type name
  nt = read(io, Int64)

  # println("Number of elements: $n")

  # Then read the type name
  cName = Array{Char}(undef, nt)

  for i in eachindex(cName)
    cName[i] = read(io, Char)
  end

  # The return type
  T = eval(Symbol(String(cName)))

  # The data
  x = read_bin(io, T, n)

  return x
end

function read_bin(fileName::String, ::Type{T}) where T

  # Open the file
  io = open(fileName, "r")

  # Read the total number of elements in the resulting array
  n = read(io, Int64)
  # Read the length of the type name
  nt = read(io, Int64)

  # Then read the type name
  cName = Array{Char}(undef, nt)

  for i in eachindex(cName)
    cName[i] = read(io, Char)
  end

  # The array to be returned
  x = Array{T, 1}(undef, n)

  @time for i in eachindex(x)
    x[i] = read(io, T)
  end

  close(io)

  return x
end

# Warm up
binFile = "data.bin"

n = 100;
arr1 = rand(Float64, n);
write_bin(arr1, binFile);
arr2 = read_bin(binFile);
arr3 = read_bin(binFile, eltype(arr1));

rm(binFile)

# Timed write read
n = 100_000_000;
arr1 = rand(Float64, n);
@time write_bin(arr1, binFile);
arr2 = read_bin(binFile);
arr3 = read_bin(binFile, eltype(arr1));

rm(binFile)