variable "filename" {
  default     = "/Users/ray/Desktop/code/terafform-template/explain/file/text.txt"
  type        = string
  description = "local file name"
}

variable "filename_list" {
  default = [
    "/Users/ray/Desktop/code/terafform-template/explain/file/text1.txt",
    "/Users/ray/Desktop/code/terafform-template/explain/file/text2.txt",
    "/Users/ray/Desktop/code/terafform-template/explain/file/text3.txt",
  ]
}

variable "filename_set" {
  type = set(string)
  default = [
    "/Users/ray/Desktop/code/terafform-template/explain/file/text4.txt",
    "/Users/ray/Desktop/code/terafform-template/explain/file/text5.txt",
    "/Users/ray/Desktop/code/terafform-template/explain/file/text6.txt",
  ]
}