locals { 
  default = timestamp()
}


output "time" { 
 value = local.default 
}

locals { 
 time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}


output "time2" { 
 value = local.time
}


/*
locals { 
 file-1 = fileexists("${path.module}/hello.txt")
}
*/ 

locals { 
  filecondition = fileexists("${path.module}/hello.txt") ? file("${path.module}/hello.txt") : local.default_content 
}


locals { 
   default_content = "No file found, please make sure file exists.!"
}

/*
output "file-1" { 
  value = local.file-1
}
*/


output "test" { 
  value = local.filecondition
}
