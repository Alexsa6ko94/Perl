sub readList{
        my $path = shift || do {
									warn '&main::readList(): Empty argument 1 $path.';
									return undef;
								};

        my $list = {};
		
        if(open my $FILE, '<', $path) {
			$list = YAML::Load(join('', <$FILE> ));
			close $FILE;
        }else{
			warn '&main::readList(): Cant open file: ' . $path . $/ . $!;
			return undef ;
        }

        return $list;
}

sub saveList{
        my $path = shift || do { warn '&main::saveList(): Empty argument 1 $path.'; return undef } ;
        my $list = shift || do { warn '&main::saveList(): Empty argument 2 $list.'; return undef } ;

        unless ( ref($list) eq 'HASH' ){
			warn '&main::saveList(): List is not HASH ref.' ;
			return undef;
        }

        if(open my $FILE, '>', $path) {
			print $FILE YAML::Dump($list);
			close $FILE;
        }else{
			warn '&main::readList(): Cant open file: ' . $path . $/ . $!;
			return undef;
        }

        return 1;
}

# Get list
my $list = readList($path);

# Save list
saveList($path, $list);

