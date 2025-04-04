# Hotel Management System

## Requirements

### 1. Guest Management

The system must maintain a record of guests who stay at the hotel. This includes their personal details such as name, contact information, and government-issued ID. Each guest should have a unique identifier in the system to track their reservations, payments, and service requests.

### 2. Room Management

The system should store details of all rooms available in the hotel. Each room should be categorized based on its type, such as single, double, deluxe, or suite, with pricing information for each type. Additionally, the system should track room availability and maintenance status to prevent overbooking or allocation of unavailable rooms.

### 3. Reservation and Booking System

Guests should be able to book rooms for a specific period, with check-in and check-out dates recorded in the system. The reservation process should ensure that the selected room is available for the given dates. The system should also track the status of reservations—whether they are confirmed, checked-in, checked-out, or canceled.

### 4. Payment Processing

The system must support multiple payment methods, including cash, credit/debit cards, and online transactions. Payment details should be linked to reservations, allowing guests to pay in advance or at check-out. The system should also handle partial payments, refunds, and outstanding balances.

### 5. Employee and Staff Management

The hotel requires a structured way to manage its employees, including receptionists, housekeeping staff, managers, and kitchen staff. Each employee should have an assigned department, job position, and salary information. Employee records should also include their hire date and contact details for internal communication.

### 6. Departmental Organization

Since hotels have multiple operational units, the system should categorize employees into departments such as front desk, housekeeping, kitchen, and maintenance. Each department should have a manager responsible for overseeing operations and ensuring tasks are completed efficiently.

### 7. Housekeeping and Maintenance Tracking

Rooms require regular cleaning and maintenance. The system should allow staff to schedule housekeeping tasks and mark them as completed. Maintenance requests for room repairs, plumbing, or electrical work should also be logged and assigned to the appropriate staff members.

### 8. Additional Services and Guest Requests

Guests often request additional services such as laundry, spa treatments, room service, or airport transfers. The system should allow guests to request these services and track their status until completion. Each service should be chargeable, and the cost should be added to the guest's final bill.

### 9. Review and Feedback System

A guest feedback system should be implemented to allow guests to rate their stay and leave comments about their experience. This feedback can help hotel management improve services and address any issues reported by guests.

### 10. User Management and Role-Based Access

The system should have different user roles such as Admin, Receptionist, Housekeeping Staff, and Guest. Each role should have restricted access based on their responsibilities. For example, receptionists should manage reservations, but they shouldn’t access financial records, which should be available only to admins.

### 11. Cancellation and Refund Management

A guest may cancel a reservation before check-in, requiring a refund policy based on cancellation timing. The system should track cancellations and process refunds accordingly. Any cancellation charges or policies should be predefined in the system.

### 12. Discounts and Promotions

Hotels often offer discounts during special seasons or for loyal customers. The system should allow management to create and apply discount codes to reservations, reducing the total bill accordingly. The validity period and usage limits of these discounts should also be enforced.

## Features:

### 1. Guest Management

- **Guest Records**: The Guests table stores details about each guest, including personal information such as name, government ID, phone number, email, and address.
- **Unique Identification**: Government ID, phone number, and email are all unique for each guest, ensuring no duplicates.

### 2. Room Management

- **Room Types**: The Room_Types table defines different types of rooms (e.g., single, double, suite) with their prices.
- **Room Availability**: The Rooms table keeps track of individual rooms, their numbers, types, and current status (e.g., available, unavailable, maintenance).
- **Room Assignments**: Rooms can be assigned to specific reservations, with status updates for availability.

### 3. Reservation Management

- **Reservation Tracking**: The Reservations table stores guest reservations, including check-in and check-out dates, room assignments, total price, and reservation status.
- **Status Tracking**: Reservations can have different statuses such as confirmed, checked-in, checked-out, or cancelled.
- **Link to Guest and Room**: Each reservation is linked to a specific guest and room.

### 4. Payment Management

- **Payment Tracking**: The Payments table tracks payments for reservations, including payment amount, method, and status (pending, completed, failed).
- **Payment Methods**: Supports different payment methods, including cash, credit card, debit card, and online.
- **Link to Reservation**: Payments are linked to specific reservations.

### 5. Employee and Department Management

- **Employee Records**: The Employees table stores employee details, including name, position, salary, and hire date.
- **Department Structure**: The Departments table defines departments (e.g., housekeeping, reception), each with a manager (employee).
- **Employee Department Assignments**: The Employee_Departments table links employees to departments, supporting many-to-many relationships.

### 6. Housekeeping Management

- **Task Assignment**: The Housekeeping table tracks housekeeping tasks for rooms, such as cleaning, inspection, and maintenance.
- **Task Status**: Housekeeping tasks can have statuses like pending, in progress, and completed.
- **Employee Assignment**: Each housekeeping task is assigned to an employee and a specific room.

### 7. Service Management

- **Service Offering**: The Services table defines additional services (e.g., laundry, room service) available to guests.
- **Service Requests**: The Guest_Services table tracks service requests made by guests during their stay, including their status.
- **Link to Reservation**: Services are linked to specific reservations.

### 8. Review and Feedback System

- **Guest Reviews**: The Reviews table allows guests to leave reviews for their stay, including a rating (1 to 5 stars) and review text.
- **Link to Guest and Reservation**: Reviews are associated with specific guests and reservations.

### 9. Discount Management

- **Discounts**: The Discounts table tracks discount codes, their percentage, and validity dates.
- **Applied Discounts**: The Applied_Discounts table tracks which discounts were applied to specific reservations.

### 10. Cancellation Management

- **Reservation Cancellations**: The Cancellations table stores cancellation information, including reasons and dates.
- **Link to Reservation**: Cancellations are associated with specific reservations.

### 11. User Management

- **User Roles**: The Users table allows for the creation of different user roles (e.g., admin, receptionist, housekeeping, guest).
- **Guest and Employee Association**: The Users table can be linked to either a guest or an employee (not both), based on the user's role.
- **Password Security**: Stores a hashed password for each user.

### 12. Foreign Key Constraints and Integrity

- **Foreign Key Constraints**: Several foreign key constraints ensure data integrity by linking tables (e.g., linking reservations to guests, rooms to room types, payments to reservations, etc.).
- **Check Constraints**: Enforces valid values for certain columns (e.g., status, role, task type, payment method).

### 13. Automatic Time Stamps

- **Automatic Timestamps**: Fields like created_at and payment_date are automatically populated with the current timestamp whenever a new record is created.

### 14. Identity Columns

- **Auto-incrementing IDs**: The use of GENERATED ALWAYS AS IDENTITY ensures that primary keys (e.g., guest_id, room_id) are automatically generated and incremented.

### 15. Data Validation

- **Unique Constraints**: Ensures that certain columns (e.g., phone number, email, government ID) have unique values.
- **Data Range Validation**: Columns like rating and discount_percentage have validation to ensure they fall within acceptable ranges (e.g., rating between 1 and 5).
