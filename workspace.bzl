load("//:repo.bzl", "tf_http_archive", "third_party_http_archive")

def clean_dep(dep):
    return str(Label(dep))

def dependencies():
    tf_http_archive(
        name = "zlib",
        build_file = clean_dep("//third_party:zlib.BUILD"),
        sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
        strip_prefix = "zlib-1.2.11",
        system_build_file = clean_dep("//third_party/systemlibs:zlib.BUILD"),
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/zlib.net/zlib-1.2.11.tar.gz",
            "https://zlib.net/zlib-1.2.11.tar.gz",
        ],
    )

    third_party_http_archive(
        name = "vulkan_headers",
        strip_prefix = "Vulkan-Headers-0e57fc1cfa56a203efe43e4dfb9b3c9e9b105593",
        sha256 = "096c4bff0957e9d6777b47d01c63e99ad9cf9d57e52be688a661b2473f8e52cb",
        urls = [
            "https://mirror.bazel.build/github.com/KhronosGroup/Vulkan-Headers/archive/0e57fc1cfa56a203efe43e4dfb9b3c9e9b105593.tar.gz",
            "https://github.com/KhronosGroup/Vulkan-Headers/archive/0e57fc1cfa56a203efe43e4dfb9b3c9e9b105593.tar.gz",
        ],
        build_file = "//third_party:vulkan_headers.BUILD",
    )
