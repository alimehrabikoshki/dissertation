terraform { 
  backend "gcs" { 
    bucket  = "tf_remote_state_amkdiss_test" 
    credentials = "/vm/uni/terraform/auth/service-key/voltaic-reducer-304616-ce2e65eb1f38.json" 
  } 
} 
