# Tickets Manager

A Ruby on Rails web application for managing support tickets with full CRUD functionality, search, and filtering capabilities.

## Overview

Tickets Manager is a simple yet functional ticket tracking system built with Rails following the MVC pattern. It allows users to create, view, update, and delete support tickets while providing powerful search and filtering options.

## Features

- **Full CRUD Operations**: Create, read, update, and delete tickets
- **Advanced Search**: Search tickets by title or description (case-insensitive)
- **Flexible Filtering**: Filter by status, priority, and creator
- **Responsive Design**: Clean, intuitive user interface
- **Data Validation**: Ensures ticket integrity with required fields and constraints
- **Default Values**: Automatic status and priority assignment

## Tech Stack

- **Framework**: Ruby on Rails 8.0
- **Database**: SQLite3
- **Testing**: RSpec
- **Language**: Ruby 3.4+

## System Requirements

- Ruby 3.2 or higher
- Rails 8.0 or higher
- SQLite3
- Bundler

## Installation & Setup

### 1. Clone or navigate to the project
```bash
cd tickets-manager
```

### 2. Install dependencies
```bash
bundle install
```

### 3. Create and set up the database
```bash
rails db:create
rails db:migrate
```

### 4. (Optional) Load sample data
```bash
rails db:seed
```

This will create 8 sample tickets for testing.

## Running the Application

### Start the Rails server
```bash
rails server
```

Or use the shorthand:
```bash
rails s
```

The application will be available at `http://localhost:3000`

## How to Use

### Viewing Tickets
1. Open `http://localhost:3000` in your browser
2. You'll see a list of all tickets with their status and priority badges

### Creating a New Ticket
1. Click the **"New Ticket"** button
2. Fill in the required **Title** field
3. Optionally add:
   - **Description**: Detailed information about the ticket
   - **Status**: Open, In Progress, or Closed (defaults to "Open")
   - **Priority**: Low, Medium, High, or Urgent (defaults to "Medium")
   - **Created By**: Creator's email address
4. Click **"Submit"** to save

### Searching Tickets
1. Use the search box to find tickets by title or description
2. Search is case-insensitive and matches partial text

### Filtering Tickets
1. Select a **Status** filter (Open, In Progress, Closed)
2. Select a **Priority** filter (Low, Medium, High, Urgent)
3. Enter a **Creator** email to filter by person
4. Combine multiple filters for precise results
5. Click **"Filter"** to apply
6. Click **"Clear"** to reset all filters

### Viewing a Ticket
1. Click **"View"** on any ticket card
2. See full details including:
   - Complete description
   - Creation and update timestamps
   - Creator information
   - Current status and priority

### Editing a Ticket
1. From the ticket list, click **"Edit"**
2. Or from the ticket detail page, click **"Edit"**
3. Modify any field
4. Click **"Submit"** to save changes

### Deleting a Ticket
1. Click **"Delete"** on the ticket card or detail page
2. Confirm when prompted
3. Ticket will be removed permanently

## Running Tests

### Run the full RSpec test suite
```bash
bundle exec rspec
```

### Run tests with detailed output
```bash
bundle exec rspec --format documentation
```

### Run a specific test file
```bash
bundle exec rspec spec/models/ticket_spec.rb
bundle exec rspec spec/requests/tickets_spec.rb
```

### Run with coverage report
```bash
bundle exec rspec --format documentation --profile
```

## Ticket Data Structure

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| title | string | ✅ | Ticket subject |
| description | text | ❌ | Detailed information (max 5000 chars) |
| status | string | ❌ | open, in_progress, closed (default: open) |
| priority | string | ❌ | low, medium, high, urgent (default: medium) |
| created_by | string | ❌ | Creator's email or identifier |
| created_at | timestamp | 🔒 | Auto-generated |
| updated_at | timestamp | 🔒 | Auto-generated |

## Project Structure

```
tickets-manager/
├── app/
│   ├── controllers/       # Request handlers
│   │   └── tickets_controller.rb
│   ├── models/           # Data models
│   │   └── ticket.rb
│   ├── views/            # ERB templates
│   │   └── tickets/
│   │       ├── index.html.erb
│   │       ├── show.html.erb
│   │       ├── new.html.erb
│   │       ├── edit.html.erb
│   │       └── _form.html.erb
│   └── helpers/
├── config/               # Configuration files
│   ├── routes.rb
│   └── database.yml
├── db/
│   ├── migrate/         # Database migrations
│   └── seeds.rb         # Sample data
├── spec/                # RSpec test files
│   ├── models/
│   ├── requests/
│   └── rails_helper.rb
└── Gemfile              # Project dependencies
```

## Validation Rules

- **Title**: Required, cannot be empty
- **Description**: Optional, max 5000 characters
- **Status**: Must be one of: `open`, `in_progress`, `closed`
- **Priority**: Must be one of: `low`, `medium`, `high`, `urgent`
- **Created By**: Optional, any string value

## Common Commands

```bash
# Create database
rails db:create

# Run migrations
rails db:migrate

# Load seed data
rails db:seed

# Reset database (warning: destroys all data)
rails db:reset

# Start development server
rails server -p 3000

# Open Rails console
rails console

# Run RSpec tests
bundle exec rspec

# Run tests with verbose output
bundle exec rspec --format documentation
```

## Troubleshooting

### Port 3000 already in use
```bash
rails server -p 3001
```

### Database locked error
```bash
rm storage/*.sqlite3
rails db:create
rails db:migrate
```

### Gemfile lock conflicts
```bash
bundle update
```

## Future Enhancements

- User authentication and authorization
- Ticket assignment to users
- Comments/notes on tickets
- File attachments
- Email notifications
- Ticket activity history
- Advanced filtering with date ranges
- CSV export functionality
- Pagination for large lists

## Rails Conventions Used

✅ RESTful routing  
✅ Active Record ORM  
✅ ERB templating  
✅ Rails validations  
✅ Database migrations  
✅ CSRF protection  
✅ Built-in helpers  

## No External Dependencies

This project uses only Rails built-in features:
- No CSS frameworks (inline styling)
- No JavaScript libraries beyond Rails defaults
- No external gems beyond what Rails includes
- Pure Active Record for database access

## Support

For issues or questions, review the [DOCUMENTATION.md](DOCUMENTATION.md) file for more technical details.

## License

This project is open source and available for educational purposes.
