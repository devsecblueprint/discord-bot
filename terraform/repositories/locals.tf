locals {
  ecr_lifecycle_policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep only one untagged image, expire all others",
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
  EOF
  ecr_repo_names = [
    # Newsletter Images
    "dsb-discord-hackernews-image",

    # YouTube Listener Image
    "dsb-discord-youtube-subscriber-image"
  ]
}
