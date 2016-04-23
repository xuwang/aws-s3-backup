# s3 bucket for backup data
variable "bucket-prefix" {
    default = "my-super-safe-data"
}

resource "aws_s3_bucket" "backup" {
    bucket = "${var.bucket-prefix}-backup"

    # It is a backup, don't destroy it if not empty!
    # force_destroy = false

    # force destroy for testing only
    force_destroy = true

    acl = "private"
    tags {
        Name = "irt-services-2016-backup"
    }

    provisioner "local-exec" {
    command = <<CMD_DATA
        printf "%s" "${aws_s3_bucket.backup.id}" > artifacts/aws-backup-bucket.key;
        printf "%s" "${aws_s3_bucket.backup.region}" > artifacts/aws-backup-region.key;
CMD_DATA
    }
}
