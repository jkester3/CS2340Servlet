<%@ include file="header.jsp" %>
<%@ page import="database.User" %>
<%@ page import="database.Itinerary" %>
<%@ page import="java.util.List" %>
<%@ page import="database.DataManager" %>
<%
   User user = (User) session.getAttribute("currentUser");
   int userID = user.getID();
   List<Itinerary> itineraries = DataManager.getItineraryByUserID(userID);
%>

<a href="#" class="btn btn-lg btn-success"
   onclick="showPage1()"
   data-toggle="modal"
   data-target="#itineraryModal">Create New Itinerary</a>
<br />
<a href="index.jsp" class="btn btn-lg btn-primary">Index</a>

<h1>Current Itinerary Names:</h1>
<ul>
    <% for (Itinerary it : itineraries) { %>
    <li><%=it.getName()%></li>
    <% } %>
</ul>

<div id="itineraryModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="itineraryModal" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <form id="itinerary_form" action="/CS2340Servlet/itineraryCreation" method="POST" class="form-inline" role="form">

                <div id="form_page_1">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                        <h4 class="modal-title">Itinerary Creation (1/3)</h4>
                    </div>
                    <div class="modal-body">
                        <h4>First, let's create a name for your Itinerary</h4><br />
                        <p>Enter a name for the Itinerary:</p>
                        <div class="form-group">
                            <label class="sr-only" for="itineraryName">Itinerary Name</label>
                            <input type="text" class="form-control" id="itineraryName" name="itineraryName"
                                   required="required"
                                   placeholder = "Itinerary Name" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button onclick="showPage2()" type="button" class="btn btn-primary">Next</button>
                    </div>
                </div>

                <div id="form_page_2">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                        <h4 class="modal-title">Itinerary Creation (2/3)</h4>
                    </div>
                    <div class="modal-body">
                        <h4>Next, let's designate your Itinerary's Address</h4><br />

                        <p>Enter an address for the Itinerary's location:</p>
                        <div class="form-group">
                            <label class="sr-only" for="itineraryAddress">Location</label>
                            <input type="text" class="form-control" id="itineraryAddress" name="itineraryAddress"
                                   required="required"
                                   placeholder = "Address" />
                            <button onclick="codeAddress()" type="button" class="btn btn-default">Find</button>
                        </div><br /><hr />

                        <div id="myMap" style="width: 520px; height: 300px;"></div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button onclick="showPage1()" type="button" class="btn btn-primary">Previous</button>
                        <button onclick="showPage3()" type="submit" class="btn btn-primary">Next</button>
                    </div>
                </div>

                <div id="form_page_3">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                        <h4 class="modal-title">Itinerary Creation (3/3)</h4>
                    </div>
                    <div class="modal-body">
                        <h4>Finally, let's specify your Transportation Style</h4><br />
                        <div class="form-group">
                            <label class="sr-only" for="itineraryTransportation">Transportation Style</label>
                            <input type="text" class="form-control" id="itineraryTransportation" name="itineraryTransportation"
                                   required="required"
                                   placeholder = "Transportation Style" />
                        </div>

                        <br />
                        <br />

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button onclick="showPage2()" type="button" class="btn btn-primary">Previous</button>
                        <button type="submit" class="btn btn-success" id="submitButton">Create</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwnaM0fAa8jqx3O7ZdABTaWmbOW3Uft2Y">
</script>

<script type="text/javascript">
    // If the user has no itineraries, automatically load the modal dialog.
    // This is a tentative feature.
    window.onload = function() {
        $("#itineraryModal").modal("show");
        showPage1();
    }

    function showPage1() {
        $("#form_page_1").show();
        $("#form_page_2").hide();
        $("#form_page_3").hide();
    }

    function showPage2() {
        // Check if page 1 fields are empty
        var elements = document.getElementById("form_page_1")
                .getElementsByTagName("input");
        for (var i = 0; i < elements.length; i++) {
            if (elements[i].value === "") {
                document.getElementById("submitButton").click();
                return;
            }
        }
        $("#form_page_1").hide();
        $("#form_page_2").show();
        initialize();
    }

    function showPage3() {
        $("#form_page_2").hide();
        $("#form_page_3").show();
    }

    var geocoder;
    var map;
    function initialize() {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(-34.397, 150.644);
        var mapOptions = {
            zoom: 8,
            center: latlng
        }
        map = new google.maps.Map(document.getElementById("myMap"), mapOptions);
    }

    function codeAddress() {
        var address = document.getElementById("itineraryAddress").value;
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
            } else {
                alert("Address could not be found for the following reason: " + status);
            }
        });
    }
</script>

<%@ include file="footer.jsp" %>