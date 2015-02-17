---
title: "Schedule of Events"
layout: table
---


<script>
function format ( d ) {
    // `d` is the original data object for the row
    // This is how you format the expansion child rows
        
  if(d.registration_link) { reg=d.registration_link; } else { reg=""; }
  if(d.cof) { var cof=d.cof; } else { cof=""; }
  if(d.results) { results=d.results; } else { results=""; }

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
         '<p>'+reg+
         '<p>'+cof+
         '<p>'+results+
         '</div>';
}

/// Custom filter to only get events in the future
/// column 0 is actually the child expansion column. Date is in column[1]
$.fn.dataTableExt.afnFiltering.push(
    function( settings, data, dataindex ) {
        
        //Set the date to filter against to 3 days ago.
        var mydate = new Date();
        mydate.setDate(mydate.getDate() -3 );
        var evdate = new Date(data[1]);
        
        if ( mydate > evdate  )
        {
            return false;
        }
        else
        {
            return true;
        }
    }
);


// Table for schedule
// Needs fields for date, match_type, info, location, 
// starttime, ns_time, match_time, notes, cof, results

$(document).ready(function() {
    var table = $('#schedule').DataTable( {
        "ajax": "/events.txt",
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
    $('#schedule tbody').on('click', 'td.details-control', function () {
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


<table id="schedule" class="row-border" cellspacing="0" width="100%">
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
