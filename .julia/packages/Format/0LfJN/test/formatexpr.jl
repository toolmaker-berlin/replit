@testset "format with positional arguments" begin

    @test format("{1}", 10) == "10"
    @test format("αβγ {1}", 10) == "αβγ 10"
    @test format("{1} efg", 10) == "10 efg"
    @test format("{1} ϵζη", 10) == "10 ϵζη"
    @test format("abc {1} efg", 10) == "abc 10 efg"
    @test format("αβγ{1}ϵζη", 10) == "αβγ10ϵζη"
    @test format("{1} + {2}", 10, "xyz") == "10 + xyz"
    @test format("{1} + {2}", 10, "χψω") == "10 + χψω"
    @test format("abc {1} + {2}", 10, "xyz") == "abc 10 + xyz"
    @test format("αβγ {1} + {2}", 10, "χψω") == "αβγ 10 + χψω"
    @test format("{1} + {2} efg", 10, "xyz") == "10 + xyz efg"
    @test format("{1} + {2} ϵζη", 10, "χψω") == "10 + χψω ϵζη"
    @test format("abc {1} + {2} efg", 10, "xyz") == "abc 10 + xyz efg"
    @test format("αβγ {1} + {2} ϵζη", 10, "χψω") == "αβγ 10 + χψω ϵζη"
    @test format("abc {1}{2} efg", 10, "xyz") == "abc 10xyz efg"
    @test format("αβγ {1}{2} ϵζη", 10, "χψω") == "αβγ 10χψω ϵζη"

    @test format("{1:d} + {2:s}", 10, "xyz") == "10 + xyz"
    @test format("{1:d} + {2:s}", 10, "χψω") == "10 + χψω"
    @test format("{1:04d} + {2:*>5}", 10, "xyz") == "0010 + **xyz"
    @test format("{1:04d} + {2:⋆>5}", 10, "χψω") == "0010 + ⋆⋆χψω"
    @test format("let {2:<5} := {1:.4f};", 12.3, "var") == "let var   := 12.3000;"
    @test format("let {2:<5} := {1:.4f};", 12.3, "χψω") == "let χψω   := 12.3000;"

    @test format("{}", 10) == "10"
    @test format("{} + {}", 10, 20) == "10 + 20"
    @test format("{} + {:04d}", 10, 20) == "10 + 0020"
    @test format("{:03d} + {}", 10, 20) == "010 + 20"
    @test format("{:03d} + {:04d}", 10, 20) == "010 + 0020"
    @test_throws(ErrorException, format("{1} + {}", 10, 20) )
    @test_throws(ErrorException, format("{} + {1}", 10, 20) )
    @test_throws(ErrorException, format("{1", 10) )

    f = FormatExpr("{1:s}")
    printfmt(f,"")
    printfmtln(f,"")
    io = IOBuffer()
    printfmt(io,f,"foobar")
    @test io.size == 6
    printfmtln(io,f,"ugly")
    @test io.size == 11
end

@testset "format escape {{ and }}" begin
    @test format("{{}}") == "{}"
    @test format("{{{1}}}", 10) == "{10}"
    @test format("v: {{{2}}} = {1:.4f}", 1.2, "ab") == "v: {ab} = 1.2000"
    @test format("χ: {{{2}}} = {1:.4f}", 1.2, "αβ") == "χ: {αβ} = 1.2000"
end

@testset "format with filter" begin
    @test format("{1|>abs2} + {2|>abs2:.2f}", 2, 3) == "4 + 9.00"
end

@testset "test typemin/typemax edge cases" begin
    f = FormatExpr("{1:+d}")
    for T in (Int8,Int16,Int32,Int64)
        @test format(f, typemin(T)) == string(typemin(T))
        @test format(f, typemax(T)) == "+"*string(typemax(T))
    end
end
