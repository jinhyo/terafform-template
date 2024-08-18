# local_file: provider, resource type
# hello: resource name
resource "local_file" "hello" {
    filename = "/Users/ray/Desktop/code/learning/teraform-practice/local/file/hello.txt"
    content = "hello world"
    file_permission = "0777"
}