#!perl
#use Win32;


#print Win32::GetOSName(),"\n";
#print Win32::GetCwd(), "\n"; 
#print Win32::GetOSVersion(),"\n";





use Net::SMTP;

# mail_user should be your_mail@163.com
sub send_mail{
    my $to_address  = shift;
    my $mail_user   = 'yin.dong@ckt-group.com';
    my $mail_pwd    = 'dongyin68';
    my $mail_server = 'smtp.ckt-group.com';

    my $from    = "From: $mail_user\n";
    my $subject = "Subject: here comes the subject\n";

    my $message = <<CONTENT; 
    **********************
    here comes the content
    **********************
CONTENT

    my $smtp = Net::SMTP->new($mail_server);

    $smtp->auth($mail_user, $mail_pwd) || die "Auth Error! $!";
    $smtp->mail($mail_user);
    $smtp->to($to_address);

    $smtp->data();             # begin the data
    $smtp->datasend($from);    # set user
    $smtp->datasend($subject); # set subject
    $smtp->datasend($message); # set content
    $smtp->dataend();

    $smtp->quit();
}



send_mail "yin.dong@ck-telecom.com";