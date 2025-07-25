# 🚀 AI-Powered CV Builder & Job Search Platform

A comprehensive full-stack application that combines professional CV building with intelligent job search capabilities. Built with React, TypeScript, Tailwind CSS, and Supabase.

## ✨ Features

### 🎯 Core Functionality
- **AI-Powered Job Search**: Intelligent job matching with global listings
- **Professional CV Builder**: Real-time CV creation with live preview
- **One-Click Applications**: Automated job applications using saved CV
- **Smart Matching**: AI calculates compatibility scores between skills and jobs
- **Location-Based Search**: Filter jobs by country, city, or remote options
- **Career Guidance**: Interactive guides and professional blog content

### 🛠️ Technical Features
- **Real-time Updates**: Live preview and instant search results
- **Responsive Design**: Optimized for mobile, tablet, and desktop
- **Secure Authentication**: JWT-based auth with Supabase
- **Data Persistence**: Cloud database with automatic backups
- **Performance Optimized**: Lazy loading and code splitting
- **Modern UI/UX**: Professional design with smooth animations

## 🏗️ Architecture

### Frontend Stack
- **React 18** with TypeScript for type safety
- **Tailwind CSS** for modern, responsive styling
- **Lucide React** for beautiful, consistent icons
- **Vite** for fast development and building

### Backend Stack
- **Supabase** for database and authentication
- **PostgreSQL** with Row-Level Security (RLS)
- **Real-time subscriptions** for live updates
- **Edge Functions** for serverless computing

### Database Schema
```sql
-- Users table
users (
  id: uuid (primary key),
  email: text (unique),
  name: text,
  created_at: timestamptz,
  updated_at: timestamptz
)

-- CVs table
cvs (
  id: uuid (primary key),
  user_id: uuid (foreign key),
  personal_info: jsonb,
  summary: text,
  experience: jsonb[],
  education: jsonb[],
  skills: text[],
  template: text,
  created_at: timestamptz,
  updated_at: timestamptz
)

-- Jobs table
jobs (
  id: uuid (primary key),
  title: text,
  company: text,
  location: text,
  type: text,
  salary: text,
  description: text,
  requirements: text[],
  apply_url: text,
  posted_at: timestamptz,
  created_at: timestamptz
)
```

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ and npm
- Supabase account
- Git

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd cv-builder-app
```

2. **Install dependencies**
```bash
npm install
```

3. **Set up environment variables**
```bash
cp .env.example .env
```

4. **Configure Supabase**
- Create a new Supabase project
- Copy your project URL and anon key to `.env`
- Run the database migrations

5. **Start development server**
```bash
npm run dev
```

## 🔧 Configuration

### Environment Variables
```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### Database Setup
1. Go to your Supabase dashboard
2. Navigate to SQL Editor
3. Run the migration files in order:
   - `supabase/migrations/create_tables.sql`
   - `supabase/migrations/fix_auth_and_rls.sql`

## 📱 Usage

### For Job Seekers
1. **Create Account**: Sign up with email and password
2. **Build CV**: Use the intuitive CV builder with real-time preview
3. **Search Jobs**: Find opportunities with AI-powered matching
4. **Apply Instantly**: One-click applications with your saved CV
5. **Track Progress**: Monitor your applications and saved jobs

### For Developers
1. **Component Structure**: Modular React components with TypeScript
2. **State Management**: React Context for authentication
3. **API Integration**: Centralized service layer for Supabase
4. **Error Handling**: Comprehensive error boundaries and validation
5. **Performance**: Lazy loading and optimized bundle splitting

## 🎨 Design System

### Color Palette
- **Primary**: Blue gradient (#3B82F6 to #8B5CF6)
- **Secondary**: Purple gradient (#8B5CF6 to #EC4899)
- **Success**: Green (#10B981)
- **Warning**: Yellow (#F59E0B)
- **Error**: Red (#EF4444)
- **Neutral**: Gray scale (#F9FAFB to #111827)

### Typography
- **Headings**: Inter font family, bold weights
- **Body**: Inter font family, regular weight
- **Code**: Fira Code, monospace

### Components
- **Buttons**: Multiple variants with hover states
- **Forms**: Consistent styling with validation
- **Cards**: Elevated design with subtle shadows
- **Navigation**: Responsive with active states

## 🔒 Security

### Authentication
- JWT tokens with automatic refresh
- Secure password hashing
- Email verification (optional)
- Session management

### Data Protection
- Row-Level Security (RLS) policies
- Input validation and sanitization
- CORS configuration
- Environment variable protection

## 📊 Performance

### Optimization Techniques
- **Code Splitting**: Lazy loading of route components
- **Bundle Analysis**: Optimized chunk sizes
- **Image Optimization**: Responsive images with lazy loading
- **Caching**: Browser and CDN caching strategies
- **Database**: Indexed queries and connection pooling

### Metrics
- **First Contentful Paint**: < 1.5s
- **Largest Contentful Paint**: < 2.5s
- **Time to Interactive**: < 3.5s
- **Cumulative Layout Shift**: < 0.1

## 🚀 Deployment

### Netlify Deployment
```bash
# Build the project
npm run build

# Deploy to Netlify
# The netlify.toml file is already configured
```

### Vercel Deployment
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel --prod
```

### Environment Setup
1. Set environment variables in your deployment platform
2. Configure build settings:
   - Build command: `npm run build`
   - Output directory: `dist`
   - Node version: 18+

## 🧪 Testing

### Running Tests
```bash
# Unit tests
npm run test

# E2E tests
npm run test:e2e

# Coverage report
npm run test:coverage
```

### Test Structure
- **Unit Tests**: Component and utility testing
- **Integration Tests**: API and database testing
- **E2E Tests**: Full user journey testing

## 🤝 Contributing

### Development Workflow
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

### Code Standards
- **TypeScript**: Strict mode enabled
- **ESLint**: Airbnb configuration
- **Prettier**: Automatic code formatting
- **Husky**: Pre-commit hooks

## 📝 API Documentation

### Authentication Endpoints
- `POST /auth/signup` - Create new user account
- `POST /auth/signin` - User login
- `POST /auth/signout` - User logout
- `GET /auth/user` - Get current user

### CV Management
- `GET /api/cvs` - Get user's CVs
- `POST /api/cvs` - Create new CV
- `PUT /api/cvs/:id` - Update CV
- `DELETE /api/cvs/:id` - Delete CV

### Job Search
- `GET /api/jobs` - Search jobs with filters
- `POST /api/jobs/save` - Save job for later
- `POST /api/jobs/apply` - Apply to job

## 🐛 Troubleshooting

### Common Issues

**Authentication Errors**
- Check Supabase configuration
- Verify RLS policies are set up correctly
- Ensure environment variables are set

**Database Connection Issues**
- Verify Supabase URL and keys
- Check network connectivity
- Review database migration status

**Build Errors**
- Clear node_modules and reinstall
- Check TypeScript configuration
- Verify all dependencies are installed

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Supabase** for the excellent backend-as-a-service platform
- **Tailwind CSS** for the utility-first CSS framework
- **Lucide** for the beautiful icon library
- **React Team** for the amazing frontend framework

## 📞 Support

For support, email support@cvbuilder.com or join our Discord community.

---

**Built with ❤️ by the CV Builder Team**#   c v - b u i l d e r - f o r - a l l  
 