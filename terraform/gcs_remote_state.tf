terraform { 
  backend "gcs" { 
    bucket  = "tf_remote_state131"
    credentials = "/mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/service-key/service-key.json"
  }
}
