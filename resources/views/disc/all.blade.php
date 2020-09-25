@extends('layouts.app')

@section('content')
<!--<div class="col-md-9">-->
<div class="container">
	<div class="col-md-8 col-md-offset-2">
		<div class="row">
			<h2>{{$title}}</h2>
		</div>
			
		<table border = "2">
			<tr>					
				<th>Исполнитель</th>
				<th>Название пластины</th>	
			</tr>
			@foreach ($discs as $disc)
			<tr>						
				<td>{{$disc->name}}</td>					
				<td>{{$disc->text}}</td>								
			</tr>							
			@endforeach
		</table>

		{{ $discs->links() }} 

		@if (session('message'))
			<div class="alert alert-success">
			{{ session('message') }}
			</div>
		@endif
	</div>
</div>
@endsection