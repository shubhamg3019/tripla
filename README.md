# Good Night Application

The "Good Night" application allows users to track their sleep patterns by recording their bedtime and wake-up times. It provides RESTful APIs for clocking in, following/unfollowing users, and retrieving sleep records.

## Prerequisites

- Ruby version 3.2.2
- Rails version 7.0.5
- Database (e.g., SQLite)

## Getting Started

1. Clone the repository: `git clone https://github.com/shubhamg3019/tripla.git`
2. Install dependencies: `bundle install`
3. Set up the database: `rails db:create db:migrate db:seed`
4. Start the Rails server: `rails server`

## API Endpoints

### Clock In

- URL: `POST /api/v1/sleep_records/clock_in/:user_id`
- Parameters:
  - `user_id` (integer): ID of the user clocking in
- Description: Creates a new sleep record with the current time as the bedtime for the specified user.

### Wake Up

- URL: `PATCH /api/v1/sleep_records/wake_up/:id`
- Parameters:
  - `id` (integer): ID of the sleep record to update
- Description: Updates the wake-up time of the specified sleep record to the current time.

### Get All Sleep Records

- URL: `GET /api/v1/sleep_records`
- Description: Retrieves all sleep records, ordered by their creation time.

### Get Following Sleep Records

- URL: `GET /api/v1/sleep_records/following_sleep_records/:user_id`
- Parameters:
  - `user_id` (integer): ID of the user whose followed users' sleep records are to be retrieved
- Description: Retrieves sleep records of the users followed by the specified user from the previous week, sorted by the duration of sleep length.

### Follow User

- URL: `POST /api/v1/users/:id/follow/:followed_user_id`
- Parameters:
  - `id` (integer): ID of the user performing the follow action
  - `followed_user_id` (integer): ID of the user being followed
- Description: Establishes a follow relationship between the specified users.

### Unfollow User

- URL: `DELETE /api/v1/users/:id/unfollow/:followed_user_id`
- Parameters:
  - `id` (integer): ID of the user performing the unfollow action
  - `followed_user_id` (integer): ID of the user being unfollowed
- Description: Removes the follow relationship between the specified users.
