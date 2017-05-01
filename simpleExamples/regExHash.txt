my %title_hash = (
    qr/Agroindustria/ => 'Analisis Sector Agroindustria',
    qr/Alimentos/     => 'Analisis Sector Industria de Alimentos',
    qr/Be.+?as/is     => 'Analisis Sector Industria de Bebidas'
);
 
my $str = "beXXXXXXas";

my $match = undef;

# One-line version:
($str =~ qr/$_/) ? $match = $title_hash{$_} : next foreach keys %title_hash; 

# Multi-line version:

# foreach (keys %title_hash) {
#     if( $str =~ qr/$_/ ) { $match = $title_hash{$_} }
# }

print $match, $/;