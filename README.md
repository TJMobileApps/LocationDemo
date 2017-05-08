# LocationDemo
Demo of CoreLocation and MapKit APIs
  
Shows simple usage of CLLocationManger and MKMapView to track and show user location and demos the use of delegates through `CLLocationManagerDelegate`.

Also demos AutoLayout and `IBOutlet` objects and `IBAction` functions.

* Tracks user location and sums up the total distance traveled
* Allows the user to change the map type between standard, satellite and hybrid
* Adds an `MKUserTrackingBarButtonItem` to the navigation controller
* Allows the user to mark their current location with an `MKPointAnnotation`

## Important note:
In order to track locations using `CLLocationManager` an entry for `NSLocationWhenInUseUsageDescription` must be added in `Info.plist` for In Use authorization, or `NSLocationAlwaysUsageDescription` for Always authorization.
