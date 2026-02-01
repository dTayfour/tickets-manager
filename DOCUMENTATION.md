# Tickets Manager - Rails Application

A simple yet functional web application to manage support tickets built with Ruby on Rails following the MVC pattern.

## Features

✅ **Full CRUD Functionality**
- Create new tickets
- View all tickets with pagination support
- View detailed ticket information
- Edit ticket details
- Delete tickets

✅ **Search & Filter**
- Search tickets by title or description
- Filter by status (Open, In Progress, Closed)
- Filter by priority (Low, Medium, High, Urgent)
- Filter by creator email
- Combine multiple filters

✅ **Ticket Data**
- **title** (required) - Ticket subject
- **description** (optional) - Detailed information
- **status** (default: "open") - open, in_progress, closed
- **priority** (default: "medium") - low, medium, high, urgent
- **created_by** (optional) - Creator email
- **created_at** - Automatic timestamp
- **updated_at** - Automatic timestamp

## Project Structure

```
tickets-manager/
├── app/
│   ├── controllers/
│   │   └── tickets_controller.rb       # CRUD operations & filtering logic
│   ├── models/
│   │   └── ticket.rb                   # Model with validations & scopes
│   ├── views/
│   │   ├── tickets/
│   │   │   ├── index.html.erb         # List tickets with search/filter
│   │   │   ├── show.html.erb          # View single ticket
│   │   │   ├── new.html.erb           # Create ticket form
│   │   │   ├── edit.html.erb          # Edit ticket form
│   │   │   └── _form.html.erb         # Shared form partial
│   │   └── layouts/
│   │       └── application.html.erb   # Main layout
│   └── helpers/
│       └── tickets_helper.rb
├── config/
│   ├── routes.rb                       # Route definitions
│   ├── database.yml                    # Database configuration
│   └── environment/
├── db/
│   ├── migrate/
│   │   └── [timestamp]_create_tickets.rb  # Database migration
│   └── seeds.rb                        # Sample data
├── Gemfile                             # Dependencies
└── README.md
```

## MVC Architecture

### Model: `Ticket`
- **Validations**: Ensures title is required, validates status/priority enums
- **Scopes**: 
  - `search(query)` - Full-text search on title and description
  - `by_status(status)` - Filter by status
  - `by_priority(priority)` - Filter by priority
  - `by_creator(creator)` - Filter by creator
- **Callbacks**: Sets default values for status and priority

### Views: ERB Templates
- **index.html.erb** - Dashboard with search form and ticket list
- **show.html.erb** - Detail view with full ticket information
- **new.html.erb** - Create new ticket form
- **edit.html.erb** - Update existing ticket
- **_form.html.erb** - Reusable form partial

### Controller: `TicketsController`
- Implements RESTful actions: index, show, new, create, edit, update, destroy
- Handles search and filter parameters
- Uses Active Record scopes for chainable queries
- Includes proper error handling and redirects

## Database Schema

```sql
CREATE TABLE tickets (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  status VARCHAR(50) DEFAULT 'open',
  priority VARCHAR(50) DEFAULT 'medium',
  created_by VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

## Getting Started

### Prerequisites
- Ruby 3.2+
- Rails 8.0+
- SQLite3

### Installation

1. Navigate to the project directory:
```bash
cd tickets-manager
```

2. Install dependencies:
```bash
bundle install
```

3. Create and migrate the database:
```bash
rails db:create
rails db:migrate
```

4. (Optional) Seed sample data:
```bash
rails db:seed
```

### Running the Application

Start the Rails server:
```bash
rails server
```

Visit `http://localhost:3000` in your browser.

## Usage

### Creating a Ticket
1. Click "New Ticket" button
2. Fill in the required title field
3. Add optional description
4. Select status and priority
5. Enter creator email
6. Click "Submit"

### Searching Tickets
1. Use the search box to find tickets by title or description
2. Select status, priority, or creator to filter
3. Click "Filter" to apply filters
4. Click "Clear" to reset all filters

### Managing Tickets
- Click "View" to see ticket details
- Click "Edit" to modify ticket information
- Click "Delete" to remove a ticket
- Status automatically defaults to "open" and priority to "medium"

## Key Framework Features Used

✅ Rails Conventions (no custom configurations needed)
✅ Active Record ORM for database access
✅ Validations for data integrity
✅ Scopes for efficient querying
✅ ERB templating
✅ CSRF protection
✅ Rails helpers
✅ RESTful routing

## No Third-Party Dependencies Added

- No CSS frameworks (inline styles for simplicity)
- No JavaScript libraries beyond Rails defaults
- No external authentication
- No additional gems beyond Rails defaults

## Sample Data

The application comes pre-seeded with 8 sample tickets covering various statuses and priorities to demonstrate functionality.

To re-seed:
```bash
rails db:seed
```

## Validation Rules

- **Title**: Required (cannot be empty)
- **Description**: Optional, max 5000 characters
- **Status**: Must be one of: open, in_progress, closed
- **Priority**: Must be one of: low, medium, high, urgent
- **Created By**: Optional (any string)

## Error Handling

- Validation errors are displayed on the form
- Failed updates show error messages
- Invalid ticket IDs return 404 errors
- All forms handle submission errors gracefully

## Future Enhancement Ideas

- User authentication
- Ticket assignment to users
- Comments/notes on tickets
- Attachment support
- Email notifications
- Ticket history/audit trail
- Advanced filtering with date ranges
- Export to CSV
- Pagination for large ticket lists

## Development Notes

- Database: SQLite3 (configured in config/database.yml)
- ORM: Active Record (Rails built-in)
- View Layer: ERB (Rails built-in)
- Testing: Can be extended with Rails testing framework

---

Built with ❤️ using Ruby on Rails
