global class ParkLocator {
    public static String[] country(String countryname) {
        ParkService.ParksImplPort park_service = new ParkService.ParksImplPort();
        return park_service.byCountry(countryname);
    }
}
