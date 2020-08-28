@extends('layouts.app')

@section('content')
<div class="col-md-9">
	<div class="">
		<h2>Редактирование пластин</h2>
	</div>

	<table border = "2">
		<tr>					
			<th>Исполнитель</th>
			<th>Название альбома</th>
			<th>Редактировать</th>							
			<th>Удалить</th>
		</tr>

		@foreach ($discs as $disc)
		<tr>						
			<td>{{$disc->name}}</td>					
			<td>{{$disc->text}}</td>
			<td><a href = 'update/post/{{ $disc->id }}'>Редактировать</a></td>
			<td><a href = 'delete/post/{{ $disc->id }}'>Удалить</a></td>			
		</tr>
		@endforeach	
		</tr>		
	</table>

	@if (session('message'))
		<div class="alert alert-success">
		{{ session('message') }}
		</div>
	@endif
	
</div>
@endsection