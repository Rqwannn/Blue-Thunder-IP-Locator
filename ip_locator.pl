# Mengimpor modul Perl yang dibutuhkan
use Socket;
use Geo::IP;
use Term::ANSIColor;

print color 'bold bright_blue';
 
print q{

         -------------------====+====-------------------
                              {_| |_}
                            /| _|_|_ |\
                           ( |/_____\| )
                        |--`/_/  |  \_\'--|
                    ____   //( ) |    \\   ____
                   | ++ |==|\___/ \___/|==| ++ |
                    \__/   |  ___ ___  |   \__/
                          __\/oo X []\/__
                         || [\__/_\__/] ||
                        ~~~~           ~~~~ 
         ________  ______  ______  __  __  ______  ___  ___
          | |__ )  |  /_\  | |__|  ||  ||  |  /_\  ||\.. ||
          | |``|\_ | /   \ |    |  ||/\||  | /   \ || `'\||
                ~~~~~~~ ~~~~~~~   ~~~~~~   ~~~~~~~~~
 _________ _____ _____ ___  ___ ____  ___ _______  _________ _______
 |_/| |\_|  | |___| |  | |  | |  ||\.. ||  | | \ \  | |___    | |__ )
    | |     | |---| |  | ```' |  || `'\||  | |_/ /  | |_____  | |``|\_
   ~~~~~   ~~~~  ~~~~~  ~~~~~~  ~~~~  ~~~ ~~~~~~~  ~~~~~~~~~ ~~~~  ~~~~


Ip Geolocation Tool  
By: #Rqwannn

------------------------------------
};

# Menentukan IP address yang ingin dicari lokasinya
print color 'reset';
@iphost = $ARGV[0] || die "Usage : ./Iplocation.pl [host] [ip] [domain] \n\nEx:  ./Iplocation.pl  www.google.com \n     ./Iplocation.pl  216.58.210.206\n \n";
my $ip_address = @iphost;

# Membuat objek Geo::IP
my $gi = Geo::IP->new(GEOIP_STANDARD);

# Mendapatkan informasi lokasi untuk IP address tersebut
my $isp = $gi->org_by_addr($ip_address);
my $country = $gi->country_name_by_addr($ip_address);
my $country_code = $gi->country_code_by_addr($ip_address);
my $city = $gi->record_by_addr($ip_address)->city;
my $region = $gi->region_by_addr($ip_address);
my $region_code = $gi->region_name_by_addr($ip_address);
my $latitude = $gi->latitude_by_addr($ip_address);
my $longitude = $gi->longitude_by_addr($ip_address);
my $dma_code = $gi->dma_code_by_addr($ip_address); # Designated Marketing Area
my $area_code = $gi->area_code_by_addr($ip_address);
my $post_code = $gi->postal_code_by_addr($ip_address);
my $org_code = $gi->organization_by_addr($ip_address);
my $continent_code = $gi->continent_code_by_addr($ip_address);
my $timezone = $gi->time_zone_by_addr($ip_address);

# Menampilkan informasi lokasi

print "  [!] IP: ", $ip_address, "\n";
print "------------------------------------\n"; 
print "  [+] ORG: ", $org_code, "\n";
print "  [+] ISP: ", $isp, "\n";
print "  [+] Continent Code: ", $continent_code, "\n";
print "  [+] Country: ", $country," - ", $country_code, "\n";
print "  [+] City: ", $city, "\n";
print "  [+] Region: ", $region, " - " , $region_code, "\n";
print "  [+] Designated Marketing Area: ", $dma_code, "\n";
print "  [+] Area Code: ", $area_code, "\n";
print "  [+] Post Code: ", $post_code, "\n";
print "  [+] Geo: ", "Latitude: " , $latitude, " - Long: ", $longitude, "\n";
print "  [+] Time: ", "timezone: " , $timezone, "\n";
print "\n";
print "Thanyou For Use My Script";