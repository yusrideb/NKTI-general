package NKTI::general::request;

use strict;
use warnings;
use Data::Dumper;
use LWP::UserAgent;
use HTTP::Request::Common;
use CGI;
use JSON;

# Define version :
# ----------------------------------------------------------------
our $VERSION = '0.15';

# Subroutine for POST Request :
# ------------------------------------------------------------------------
=head1 SUBROUTINE post()
    
    Deskripsi subroutine post() :
    ----------------------------------------
    Subroutine yang berfungsi untuk membuat data post.

    Parameter subroutine post() :
    ----------------------------------------
    $url_request        =>  Berisi URL for POST Request.
    $data_post          =>  Beriis data Post request. Ex: [ "index" => "value", "index1" => "value1", ]

=cut
sub post {
    # ----------------------------------------------------------------
    # Define parameter subroutine :
    # ----------------------------------------------------------------
    my ($self, $url_request, $data_post) = @_;
    # ----------------------------------------------------------------
    # Define hash for place result :
    # ----------------------------------------------------------------
    my %data = ();
    # ----------------------------------------------------------------
    # Define UserAgent :
    # ----------------------------------------------------------------
    my $ua = LWP::UserAgent->new();
    my $req = POST($url_request, $data_post);
    $req->header('X-Requested-With' => 'XMLHttpRequest');
    # ----------------------------------------------------------------
    # Action Request :
    # ----------------------------------------------------------------
    my $resp = $ua->request($req);
    # ------------------------------------------------------------------------
    # Check IF $resp->is_success is true :
    # ------------------------------------------------------------------------
    if ($resp->is_success) {
        # ----------------------------------------------------------------
        # Decode Content :
        # ----------------------------------------------------------------
        my $result = $resp->decode_content;
        # ----------------------------------------------------------------
        # Place success result :
        # ----------------------------------------------------------------
        $data{'result'} = 1;
        $data{'code'} = 'success';
        $data{'data'} = $result;
    }
    # ------------------------------------------------------------------------
    # Check IF $resp->is_success is false :
    # ------------------------------------------------------------------------
    else {
        # ----------------------------------------------------------------
        # Place error result :
        # ----------------------------------------------------------------
        $data{'result'} = 0;
        $data{'code'} = 'error';
        $data{'data'} = {
            'code' => $resp->code,
            'msg' => $resp->message
        };
    }
    # ------------------------------------------------------------------------
    # End of check IF $resp->is_success is false.
    # ========================================================================
    
    # Return result :
    # ----------------------------------------------------------------
    return \%data; 
}
# End of Subroutine for POST Request
# ===========================================================================================================

# Subrotuine for GET Request :
# ------------------------------------------------------------------------
=head1 SUBROUTINE get()
    
    Deskripsi subroutine get() :
    ----------------------------------------
    Subroutine yang berfungsi untuk mengambil data.

    Parameter subroutine get() :
    ----------------------------------------
    describ_param

=cut
sub get {
    # ----------------------------------------------------------------
    # Define parameter subroutine :
    # ----------------------------------------------------------------
    my ($self, $url_request, $data_post) = @_;
    # ----------------------------------------------------------------
    # Define hash for place result :
    # ----------------------------------------------------------------
    my %data = (); 
}
# End of Subrotuine for GET Request
# ===========================================================================================================

1;
__END__
=head1 AUTHOR
    Achmad Yusri Afandi, (linuxer08@gmail.com)

=head1 COPYRIGHT AND LICENSE
    Copyright (c) 2016, Achmad Yusri Afandi, All Rights reserved.

    Pustaka yang berfungsi untuk melakukan request CGI.
=cut
