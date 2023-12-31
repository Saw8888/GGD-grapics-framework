# Specify the paths to your include directories
INCLUDE_PATH = -Iinclude/GL -Iinclude/GLFW

# Specify the paths to your library directories
LIBRARY_PATH = -Linclude/lib

# Compiler flags
CFLAGS = $(INCLUDE_PATH) -std=c99

# Linker flags
LDFLAGS = $(LIBRARY_PATH) -lopengl32 -lfreeglut -lglfw3

# Specify the target executable
TARGET = build/main

# Specify the object files
OBJECTS = build/main.o build/GGD.o

# Default target
all: $(TARGET)

$(TARGET): $(OBJECTS)
	gcc $(OBJECTS) $(CFLAGS) $(LDFLAGS) -o $(TARGET)

# Here we define the individual object files and their dependencies
build/main.o: main.c
	gcc -c main.c $(CFLAGS) -o build/main.o

build/GGD.o: src/GGD.c src/GGD.h
	gcc -c src/GGD.c $(CFLAGS) -o build/GGD.o

# Add a clean target for convenience
clean:
	rm -f build/*.o $(TARGET)

.PHONY: all clean
