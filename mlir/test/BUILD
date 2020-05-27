load("//mlir:tblgen.bzl", "gentbl")

licenses(["notice"])

package(default_visibility = [":test_friends"])

# Please only depend on this from MLIR tests.
package_group(
    name = "test_friends",
    packages = ["//..."],
)

cc_library(
    name = "IRProducingAPITest",
    hdrs = ["APITest.h"],
    includes = ["."],
)

gentbl(
    name = "TestVectorTransformPatternsIncGen",
    tbl_outs = [
        (
            "-gen-rewriters",
            "lib/DeclarativeTransforms/TestVectorTransformPatterns.h.inc",
        ),
    ],
    tblgen = "//mlir:mlir-tblgen",
    td_file = "lib/DeclarativeTransforms/TestVectorTransformPatterns.td",
    td_srcs = [
        "//mlir:VectorTransformPatternsTdFiles",
    ],
)

gentbl(
    name = "TestOpsIncGen",
    strip_include_prefix = "lib/Dialect/Test",
    tbl_outs = [
        (
            "-gen-op-decls",
            "lib/Dialect/Test/TestOps.h.inc",
        ),
        (
            "-gen-op-defs",
            "lib/Dialect/Test/TestOps.cpp.inc",
        ),
        (
            "-gen-dialect-decls",
            "lib/Dialect/Test/TestOpsDialect.h.inc",
        ),
        (
            "-gen-enum-decls",
            "lib/Dialect/Test/TestOpEnums.h.inc",
        ),
        (
            "-gen-enum-defs",
            "lib/Dialect/Test/TestOpEnums.cpp.inc",
        ),
        (
            "-gen-struct-attr-decls",
            "lib/Dialect/Test/TestOpStructs.h.inc",
        ),
        (
            "-gen-struct-attr-defs",
            "lib/Dialect/Test/TestOpStructs.cpp.inc",
        ),
        (
            "-gen-rewriters",
            "lib/Dialect/Test/TestPatterns.inc",
        ),
    ],
    tblgen = "//mlir:mlir-tblgen",
    td_file = "lib/Dialect/Test/TestOps.td",
    td_srcs = [
        "//mlir:OpBaseTdFiles",
        "//mlir:include/mlir/IR/OpAsmInterface.td",
        "//mlir:include/mlir/IR/SymbolInterfaces.td",
        "//mlir:include/mlir/Interfaces/CallInterfaces.td",
        "//mlir:include/mlir/Interfaces/ControlFlowInterfaces.td",
        "//mlir:include/mlir/Interfaces/InferTypeOpInterface.td",
        "//mlir:include/mlir/Interfaces/SideEffectInterfaces.td",
    ],
    test = True,
)

cc_library(
    name = "TestDialect",
    srcs = [
        "lib/Dialect/Test/TestDialect.cpp",
        "lib/Dialect/Test/TestPatterns.cpp",
    ],
    hdrs = [
        "lib/Dialect/Test/TestDialect.h",
    ],
    includes = [
        "lib/DeclarativeTransforms",
        "lib/Dialect/Test",
    ],
    deps = [
        ":TestOpsIncGen",
        "//llvm:support",
        "//mlir:ControlFlowInterfaces",
        "//mlir:DerivedAttributeOpInterface",
        "//mlir:Dialect",
        "//mlir:IR",
        "//mlir:InferTypeOpInterface",
        "//mlir:Pass",
        "//mlir:SideEffects",
        "//mlir:StandardOps",
        "//mlir:StandardOpsTransforms",
        "//mlir:TransformUtils",
        "//mlir:Transforms",
    ],
)

cc_library(
    name = "TestIR",
    srcs = [
        "lib/IR/TestFunc.cpp",
        "lib/IR/TestMatchers.cpp",
        "lib/IR/TestSideEffects.cpp",
        "lib/IR/TestSymbolUses.cpp",
    ],
    deps = [
        ":TestDialect",
        "//llvm:support",
        "//mlir:IR",
        "//mlir:Pass",
        "//mlir:StandardOps",
        "//mlir:Support",
    ],
)

cc_library(
    name = "TestPass",
    srcs = [
        "lib/Pass/TestPassManager.cpp",
    ],
    deps = [
        "//llvm:support",
        "//mlir:IR",
        "//mlir:Pass",
        "//mlir:Support",
    ],
)

cc_library(
    name = "TestTransforms",
    srcs = glob([
        "lib/Transforms/*.cpp",
    ]),
    defines = ["MLIR_CUDA_CONVERSIONS_ENABLED"],
    includes = ["lib/Dialect/Test"],
    deps = [
        ":TestDialect",
        ":TestVectorTransformPatternsIncGen",
        "//llvm:support",
        "//mlir:Affine",
        "//mlir:Analysis",
        "//mlir:EDSC",
        "//mlir:GPUDialect",
        "//mlir:GPUToCUDATransforms",
        "//mlir:GPUTransforms",
        "//mlir:IR",
        "//mlir:LinalgOps",
        "//mlir:LinalgTransforms",
        "//mlir:Pass",
        "//mlir:SCFDialect",
        "//mlir:StandardOps",
        "//mlir:Support",
        "//mlir:TransformUtils",
        "//mlir:Transforms",
        "//mlir:VectorOps",
        "//mlir:VectorToLLVM",
        "//mlir:VectorToSCF",
    ],
)

cc_library(
    name = "TestAffine",
    srcs = glob([
        "lib/Dialect/Affine/*.cpp",
    ]),
    deps = [
        "//llvm:support",
        "//mlir:Affine",
        "//mlir:AffineTransforms",
        "//mlir:AffineUtils",
        "//mlir:Analysis",
        "//mlir:IR",
        "//mlir:Pass",
        "//mlir:Support",
        "//mlir:Transforms",
        "//mlir:VectorOps",
    ],
)

cc_library(
    name = "TestSPIRV",
    srcs = glob([
        "lib/Dialect/SPIRV/*.cpp",
    ]),
    deps = [
        "//mlir:IR",
        "//mlir:Pass",
        "//mlir:SPIRVDialect",
        "//mlir:SPIRVLowering",
    ],
)
