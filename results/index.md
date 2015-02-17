---
title: "Results"
layout: table
---  

<script>
function format ( d ) {
    // `d` is the original data object for the row
    // This is how you format the expansion child rows

}

<!-- 
/// Custom filter to only get events in the past
/// Date is in column[1]
$.fn.dataTableExt.afnFiltering.push(
    function( settings, data, dataindex ) {
        var mydate = new Date();
        var evdate = new Date(data[0]);
        
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
 -->


// Table for results - No children
// Needs fields for date, match_type, info

$(document).ready(function() {
    $('#results').DataTable( {
        "ajax": '/events.txt',
        "paging":   true,
        "info":     false,
        "ordering": true,
        "pagingType": "full",
        "columns": [
            { "data": "date" },
            { "data": "match_type" },
            { "data": "results" },
        ],
        "order": [[0, 'desc']]
    } );
} );

</script>


<table id="results" class="row-border" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th>Date</th>
        <th>Match</th>
        <th>Results</th>
      </tr>
    </thead>
</table>

## Past Results

If you're looking for results from years past you can dig through the [archives](/old_results)


