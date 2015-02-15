---
title: "Schedule of Events"
layout: archive
categories: schedule
---


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">

<script src="/css/plugins/tidy-table.min.js"></script>
<script>
$(document).ready(function() {
	$('#container')
		.TidyTable({
			columnTitles: ['Column A', 'Column B', 'Column C', 'Column D', 'Column E'],
			columnValues: [
				['1', '1A', '1B', '1C', '1D', '1E'],
				['2', '2A', '2B', '2C', '2D', '2E'],
				['3', '3A', '3B', '3C', '3D', '3E'],
				['4', '4A', '4B', '4C', '4D', '4E'],
				['5', '5A', '5B', '5C', '5D', '5E']
			]
		});
});
</script>

<link rel="stylesheet" type="text/css" href="/css/tidy-table.min.css">


Should look into using Tidy-table or some other dynamic javascript table engine. That would let me offer an ical when they click on the date, show only the match types they want to see and do other cool stuff.

## 2015

table using html

<table id="2015">
  <tr>
    <th>Date</th>
    <th>Match Type</th>
    <th>Notes</th>
    <th>Location</th>
  </tr>
  <tr>
    <td>Jan 1</td>
    <td>Handgun Steel Challenge</td>
    <td>10AM Match start</td>
    <td>The Range</td>
  </tr>
  <tr class="alt">
    <td>Berglunds snabbköp</td>
    <td>Christina Berglund</td>
    <td>Sweden</td>
    <td>test 2</td>
  </tr>
</table>

<h2>2014</h2>

table using markdown

// Kramdown table syntax is documented at http://kramdown.gettalong.org/syntax.html#tables

| Date | Match Type | Notes | Location |
|:-:|:-:|:-|:-:|
| Feb 20 | 3 gun | This will require 300 rds of ammo, 55 birdshot and 10 slugs | The Range |
| Aug 9 | Really long match type | Bring your mortars and 10 rounds | Rangemasters |