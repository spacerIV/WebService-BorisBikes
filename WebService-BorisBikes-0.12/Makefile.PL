
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Provides a Perl interface to the London Cycle Hire Scheme.",
  "AUTHOR" => "Victor Houston <victorhouston\@gmail.com>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0,
    "Test::Warn" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "WebService-BorisBikes",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WebService::BorisBikes",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::Accessor" => 0,
    "GIS::Distance::Lite" => 0,
    "Geo::Postcode" => 0,
    "LWP::Simple" => 0,
    "Perl6::Slurp" => 0,
    "Scalar::Util" => 0,
    "Try::Tiny" => 0,
    "XML::Simple" => 0
  },
  "VERSION" => "0.12",
  "test" => {
    "TESTS" => ""
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



