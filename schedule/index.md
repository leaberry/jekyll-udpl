---
title: "Schedule of Events"
layout: table
---


<script>
function format ( d ) {
    // `d` is the original data object for the row
     return '<table class="" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>'+d.start_time+'</td>'+
            '<td>'+d.ns_time+'</td>'+
            '<td>'+d.match_time+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Match Notes</td>'+
            '<td>'+d.notes+'</td>'+
        '</tr>'+
        '<tr>'+   
            '<td><a href="'+d.cof+'">Course of Fire</a></td>'+
            '<td><a href="'+d.results+'">Match Results</a></td>'+
        '</tr>'+
    '</table>';

//        return '<div class="matchdetails"><div class="column-left">'+
//               '<p>Sign in: '+d.start_time+
//               '<p>New Shooter Meeting: '+d.ns_time+
//               '<p>Match Start: '+d.match_time+
//               '</div>'+
//               '<div class="column-center">'+
//               '<p>Sign in: '+d.start_time+
//               '<p>New Shooter Meeting: '+d.ns_time+
//               '<p>Match Start: '+d.match_time+
//               '</div>'+
//               '<div class="column-right">'+
//               '<p>Notes: '+d.notes+
//               '</div>';
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



## 2015 - child info table

<table id="2015" class="" cellspacing="0" width="100%">
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


## 2015

child fields should show
  
  * Info 
  * Sign in - $TIME - New Shooters Meeting - $TIME - Match Start - $TIME
  * COF Link
  * Results Link 
  


{:.datatable}
| Date | Match Type | Notes | Location |
|:-:|:-:|:-|:-:|
| 02-17-2015 | Funshoot | [RangeMasters Fun Shoot Info](/funshoot) | [RangeMasters](/funshoot) |
| 02-28-2015 | Handgun Man vs Man | [Register Now](https://clubs.practiscore.com/2015-udpl-man-vs-man/register) Bring 300+ rds of ammo | [The Range](/range) |
| 03-28-2015 | Handgun IDPA |  | [The Range](/range) |


<h2>2014</h2>

table using markdown

// Kramdown table syntax is documented at http://kramdown.gettalong.org/syntax.html#tables

{:.datatable}
| Date | Match Type | Notes | Location |
|:-:|:-:|:-|:-:|
| Feb 20 | 3 gun | This will require 300 rds of ammo, 55 birdshot and 10 slugs | The Range |
| Aug 9 | Really long match type | Bring your mortars and 10 rounds | Rangemasters |