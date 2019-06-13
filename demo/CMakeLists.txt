add_executable(demo
	DemoInterpreter.cpp
	DemoMethod.cpp
	DemoHelpers.cpp
	Main.cpp
)

target_link_libraries(demo bytecodes parser omr_jitbuilder_static)
