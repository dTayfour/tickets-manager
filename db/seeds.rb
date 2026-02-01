# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Ticket.destroy_all

# Create sample tickets
Ticket.create!(
  title: "Fix login page bug",
  description: "Users are unable to login on the mobile app. Need to investigate the authentication flow.",
  status: "open",
  priority: "urgent",
  created_by: "john@example.com"
)

Ticket.create!(
  title: "Add dark mode support",
  description: "Implement dark mode theme across the entire application.",
  status: "in_progress",
  priority: "high",
  created_by: "sarah@example.com"
)

Ticket.create!(
  title: "Update documentation",
  description: "Update API documentation for the new endpoints.",
  status: "open",
  priority: "medium",
  created_by: "mike@example.com"
)

Ticket.create!(
  title: "Optimize database queries",
  description: "Review and optimize slow database queries in the reporting module.",
  status: "in_progress",
  priority: "high",
  created_by: "john@example.com"
)

Ticket.create!(
  title: "Add unit tests for payment module",
  description: "Increase test coverage for the payment processing module.",
  status: "closed",
  priority: "medium",
  created_by: "emily@example.com"
)

Ticket.create!(
  title: "Setup CI/CD pipeline",
  description: "Configure GitHub Actions for automated testing and deployment.",
  status: "in_progress",
  priority: "high",
  created_by: "dev-ops@example.com"
)

Ticket.create!(
  title: "Fix typo in welcome email",
  description: "There's a spelling mistake in the welcome email template.",
  status: "open",
  priority: "low",
  created_by: "marketing@example.com"
)

Ticket.create!(
  title: "Implement two-factor authentication",
  description: "Add 2FA support for enhanced security.",
  status: "closed",
  priority: "high",
  created_by: "security@example.com"
)

puts "✓ Created 8 sample tickets"
