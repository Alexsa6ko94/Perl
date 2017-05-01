
my $match = "Calificadoras de A.m. Best America Latina S.a de C.V. InstituciOn Calificadora de Valores";
my @words = split(/\s+/, $match);
@words = map { $_ = lc($_) } @words;
@words = map { $_ = ucfirst($_) } @words;
$match = join(" ", map { $_ } @words );

#Equals to :

$match = join " ", map { ucfirst lc $_ } split(/\s+/, $match);