@@ .. @@
 /*
   # Create users table

   1. New Tables
     - `users`
       - `id` (uuid, primary key)
       - `email` (text, unique)
       - `name` (text)
       - `created_at` (timestamp)
       - `updated_at` (timestamp)
   2. Security
     - Enable RLS on `users` table
-    - Add policy for authenticated users to read their own data
+    - Add policies for authenticated users to manage their own data
 */

 CREATE TABLE IF NOT EXISTS users (
   id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
   email text UNIQUE NOT NULL,
   name text NOT NULL,
   created_at timestamptz DEFAULT now(),
   updated_at timestamptz DEFAULT now()
 );

 ALTER TABLE users ENABLE ROW LEVEL SECURITY;

+-- Allow users to insert their own profile
+CREATE POLICY "Users can create own profile"
+  ON users
+  FOR INSERT
+  TO authenticated
+  WITH CHECK (auth.uid() = id);
+
+-- Allow users to read their own profile
 CREATE POLICY "Users can read own data"
   ON users
   FOR SELECT
   TO authenticated
   USING (auth.uid() = id);

+-- Allow users to update their own profile
 CREATE POLICY "Users can update own data"
   ON users
   FOR UPDATE
   TO authenticated
   USING (auth.uid() = id)
   WITH CHECK (auth.uid() = id);