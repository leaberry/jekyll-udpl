---
title: "Schedule of Events"
layout: table
---


<script>
function format ( d ) {
    // `d` is the original data object for the row
        
        if(d.registration_link) { $reg='<a href="' + d.registration_link + '">Register for Match</a>'; } else { $reg=""; }
        if(d.cof) { $cof='<a href="' + d.cof + '">Course of Fire</a>'; } else { $cof=""; }
        if(d.results) { $results='<a href="'+d.results+'">Match Results</a>'; } else { $results=""; }

        return '<div class="matchdetails">'+
               '<ul>'+
               '<li><em>Sign in:</em> '+d.start_time+
               '</li><li><em>Shooter Meeting:</em> '+d.ns_time+
               '</li><li><em>Match Start:</em> '+d.match_time+
               '</li><li>Directions to <a href="'+d.location_url+'">'+d.location+'</a></li></ul></div>'+
               '<div class="matchdetails">'+
               '<p>'+d.notes+
               '</div>'+
               '<div class="matchdetails">'+
               '<p>'+$reg+
               '<p>'+ $cof+
               '<p>'+ $results+
               '</div>';
}

// Table for 2015 
// Needs fields for date, match_type, info, location, 
// starttime, ns_time, match_time, notes, cof, results

$(document).ready(function() {
    var table = $('#2015').DataTable( {
        "ajax": "/schedule/2015.txt",
        "paging":   false,
        "info":     false,
        "columns": [
            {
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },
            { "data": "date" },
            { "data": "match_type" },
            { "data": "info" },
            { "data": "location" }
        ],
        "order": [[1, 'asc']]
    } );
     
    // Add event listener for opening and closing details
    $('#2015 tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );
} );
</script>



## 2015

<table id="2015" class="row-border" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th></th>
                <th>Date</th>
                <th>Match Type</th>
                <th>Info</th>
                <th>Location</th>
            </tr>
        </thead>
</table>
