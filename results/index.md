---
title: "Results"
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
         '</li></ul></div>'+
         '<div class="matchdetails">'+
         '<p>'+d.notes+
         '</div>'+
         '<div class="matchdetails">'+
         '<p>'+cof+
         '<p>'+results+
         '</div>';
}

/// Custom filter to only get events in the past
/// Date is in column[1]
$.fn.dataTableExt.afnFiltering.push(
    function( settings, data, dataindex ) {
        var mydate = new Date();
        var evdate = new Date(data[1]);
        console.log(mydate+ ' event date => '+ evdate);
  
        // If the event date is the same as today or older - show it
        if ( mydate >= evdate  )
        {
            return true;
        }
        else
        {
            return false;
        }
    }
);


// Table for results
// Needs fields for date, match_type, results

$(document).ready(function() {
    var table = $('#results').DataTable( {
        "ajax": '/events.txt',
        "paging":   true,
        "info":     false,
        "ordering": true,
        "pagingType": "full",
        "columns": [
            {
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },
            { "data": "date" },
            { "data": "match_type" },
            { "data": "results" }
        ],
        "order": [[1, 'desc']]
    } );
     
    // Add event listener for opening and closing details
    $('#results tbody').on('click', 'td.details-control', function () {
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


<table id="results" class="row-border" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th></th>
        <th>Date</th>
        <th>Match</th>
        <th>Results</th>
      </tr>
    </thead>
</table>

## Past Results

If you're looking for results from years past you can dig through the [archives](/old_results)


