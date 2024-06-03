package com.example.noteappkmm.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.example.noteappkmm.android.note_detail.NoteDetailScreen
import com.example.noteappkmm.android.note_list.NoteListScreen
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApplicationTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val navController = rememberNavController()
                    NavHost(navController = navController, startDestination = "note_list") {
                        composable(route = "note_list") {
                            NoteListScreen(navController = navController)
                        }
                        composable(
                            route = "note_detail/{noteId}",
                            arguments = listOf(
                                navArgument(name = "noteId") {
                                    type = NavType.LongType
                                    defaultValue = -1L
                                }
                            )
                        ) { navBackStackEntry ->
                            val noteId = navBackStackEntry.arguments?.getLong("noteId") ?: -1L
                            NoteDetailScreen(navController = navController, noteId = noteId)
                        }
                    }
                }
            }
        }
    }
}

