---
title: "Schedule of Events"
layout: table
---


<script>

//init moment
moment().format();

// The problem with this is you can't search on the "Dec 15th 2014" Date string
// because the filter string is the original 2014/12/15 string.
// It has to be this way because we filter things and it uses the filter string
// to construct it's date.
// Could probably rework the filter part
function formatJSONDate(dateInput, type) {
  if (dateInput === null) {
    return '';
  }
  if (type === 'display' ) {
    var evdate = moment(new Date(dateInput));
    return evdate.format('MMM Do YYYY');
  }
  if (type === 'sort' || type === 'filter' ) {
    return dateInput;
  }
  
  return dateInput;
}
 
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
        
        //Set the date to filter against to 1 days ago.
        var mydate = new Date();
        mydate.setDate(mydate.getDate() -1 );
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
        'aaSorting': [[1, 'asc']],
        'aoColumns': [ 
          {
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
          },
          {'mData': "date", 
            'mRender': function(data, type, full) {
              return formatJSONDate(data, type);
            }},
          {'mData': "match_type" },
          {'mData': "info" }, 
          {'mData': "location" }
        ]
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

Clicking on the green plus symbol on the left side of each row will expand the row to show match details.

<table id="schedule" class="row-border" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th></th>
        <th>Date</th>
        <th>Match</th>
        <th>Info</th>
        <th>Location</th>
      </tr>
    </thead>
</table>
