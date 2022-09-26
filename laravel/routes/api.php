<?php

use App\Models\Sample;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('test', static function () {
    $data = Sample::orderBy('updated_at', 'desc')->first();
    return $data;
});

Route::post('test', static function (Request $request) {
    $request->validate(['text' => 'required|string']);
    return Sample::create(['text' => $request->input('text')]);
});

Route::get('health_check', static function () {
    $status = ['status' => 200, 'message' => 'success'];
    return compact('status');
});
