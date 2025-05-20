import { Component, EventEmitter, Input, Output } from '@angular/core';
import { AuthService } from '../../../Service/auth.service';
import { RoomService } from '../../../Service/room.service';
import { RoomPost } from '../../../Models/RoomPost.model';
import { ReactiveFormsModule, FormGroup, FormControl, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-add-room',
  standalone: true,
  imports: [CommonModule,ReactiveFormsModule],
  templateUrl: './add-room.component.html',
  styleUrl: './add-room.component.css'
})
export class AddRoomComponent {
  @Input() categoryId!: number;
  @Input() showModal: boolean = false; // קובע אם להציג את הפופאפ
  @Output() roomCreated = new EventEmitter<any>();
  @Output() closeModalBool = new EventEmitter<void>(); // סוגר את הפופאפ

  roomForm: FormGroup;
  isModalOpen: boolean = false; // משתנה למעקב אחר מצב המודאל
  
  constructor(private authService: AuthService, private roomService: RoomService) {
    this.roomForm = new FormGroup({
      roomName: new FormControl('', Validators.required) 
    });
  }

  openModal() {
    this.isModalOpen = true; // פותח את המודאל
  }

  closeModal() {
    this.isModalOpen = false; // סוגר את המודאל
  }

  addRoom() {
    if (this.roomForm.valid) {
      const roomData: RoomPost = {
        name: this.roomForm.value.roomName,
        categoryId: this.categoryId,
        userId: this.authService.getCurrentUserId(),
        user: this.authService.getCurrentUser()
      };

      this.roomService.addServer(roomData).subscribe({
        next: (newRoom) => {
          console.log(newRoom);
          this.roomCreated.emit(newRoom);
          this.closeModal(); // סוגר את המודאל אחרי יצירת החדר
        },
        error: (error) => {
          console.error('Failed to create room:', error);
        }
      });
    }
  }
}

