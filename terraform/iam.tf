# backup user for irt-services.
resource "aws_iam_user" "backup-user" {
    name = "backup-user"
    path = "/irt-services/"
}
resource "aws_iam_user_policy" "backup-policy" {
    name = "backup-policy"
    user = "${aws_iam_user.backup-user.name}"
    policy = "${file(\"policies/backup_user_policy.json\")}"
}
resource "aws_iam_access_key" "backup-key" {
    user = "${aws_iam_user.backup-user.name}"

    provisioner "local-exec" {
        command = <<CMD_DATA
            printf "%s"  "${aws_iam_access_key.backup-key.id}" > artifacts/aws-backup-access.key;
            printf "%s"  "${aws_iam_access_key.backup-key.secret}" > artifacts/aws-backup-access-secret.key
CMD_DATA
    }
}
