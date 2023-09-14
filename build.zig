const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libxml = b.dependency("libxml", .{ .target = target, .optimize = optimize });

    const main_tests = b.addTest(.{
        .name = "test_exe",
        .root_source_file = .{ .path = "tests/test_convert.zig" },
        .optimize = optimize,
        .target = target,
    });

    main_tests.linkLibrary(libxml.artifact("xml2"));

    const tests_run = b.addRunArtifact(main_tests);
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&tests_run.step);
}
