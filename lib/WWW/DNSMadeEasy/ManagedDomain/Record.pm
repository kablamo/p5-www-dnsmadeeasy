package WWW::DNSMadeEasy::ManagedDomain::Record;
# ABSTRACT: A managed domain record in the DNSMadeEasy API

use Moo;

has domain   => (is => 'ro', required => 1, handles => {path => 'records_path'});
has dme      => (is => 'lazy', handles => ['request']);
has response => (is => 'rw', builder  => 1, lazy => 1);

sub _build_dme      { shift->domain->dme }
sub _build_response { my $a = $_[0]->dme->request(GET => $_[0]->path)->data ; use DDP; p $a; $a; }

sub description   { shift->response->{description}  }
sub dynamic_dns   { shift->response->{dynamicDns}   }
sub failed        { shift->response->{failed}       }
sub failover      { shift->response->{failover}     }
sub gtd_location  { shift->response->{gtdLocation}  }
sub hard_link     { shift->response->{hardLink}     }
sub id            { shift->response->{id}           }
sub keywords      { shift->response->{keywords}     }
sub monitor       { shift->response->{monitor}      }
sub mxLevel       { shift->response->{mxLevel}      }
sub name          { shift->response->{name}         }
sub password      { shift->response->{password}     }
sub port          { shift->response->{port}         }
sub priority      { shift->response->{priority}     }
sub redirect_type { shift->response->{redirectType} }
sub source        { shift->response->{source}       }
sub source_id     { shift->response->{source_id}    }
sub title         { shift->response->{title}        }
sub ttl           { shift->response->{ttl}          }
sub type          { shift->response->{type}         }
sub value         { shift->response->{value}        }
sub weight        { shift->response->{weight}       }

sub delete {
    my ($self) = @_;
    $self->request('DELETE', $self->path . $self->id);
}

sub update {
	my ($self, $data) = @_;
	my $res = $self->request(PUT => $self->path . $self->id, $data)->data;
    $self->response($res);
}

1;

=encoding utf8

=head1 METHODS

=method delete()

=method update(%data)

=method response

Returns this object as a hashreference.

=head1 RECORD ATTRIBUTES

=method description

=method dynamic_dns

=method failed

=method failover

=method gtd_location

=method hard_link

=method id

=method keywords

=method monitor

=method mxLevel

=method name

=method password

=method port

=method priority

=method redirect_type

=method source

=method source_id

=method title

=method ttl

=method type

=method value

=method weight

=head1 SUPPORT

IRC

  Join #duckduckgo on irc.freenode.net and highlight Getty or /msg me.

Repository

  http://github.com/Getty/p5-www-dnsmadeeasy
  Pull request and additional contributors are welcome

Issue Tracker

  http://github.com/Getty/p5-www-dnsmadeeasy/issues


