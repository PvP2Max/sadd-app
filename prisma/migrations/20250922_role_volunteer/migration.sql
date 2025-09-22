-- Add VOLUNTEER to Role enum
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_type t
    JOIN pg_enum e ON t.oid = e.enumtypid
    WHERE t.typname = 'Role' AND e.enumlabel = 'VOLUNTEER'
  ) THEN
    ALTER TYPE "Role" ADD VALUE 'VOLUNTEER';
  END IF;
END
$$;

