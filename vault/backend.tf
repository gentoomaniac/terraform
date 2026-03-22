terraform {
    backend "s3" {
        bucket   = "terraform-state"
        key      = "vault-infrastructure/terraform.tfstate"
        endpoint = "http://minio.srv.gentoomaniac.net:9000"
        
        # Terraform requires a region, just give it a dummy value
        region   = "eu-west-3" 

        # The magic flags that make local MinIO work
        skip_credentials_validation = true
        skip_region_validation      = true
        skip_metadata_api_check     = true
        skip_requesting_account_id  = true
        skip_s3_checksum            = true
        use_path_style              = true # VERY important for MinIO!
    }
}