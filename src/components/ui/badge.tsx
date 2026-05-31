import * as React from "react"
import { cva, type VariantProps } from "class-variance-authority"
import { cn } from "../../lib/utils"

const badgeVariants = cva(
  "inline-flex items-center border px-2 py-0.5 text-[10px] font-medium uppercase tracking-wider transition-colors focus:outline-none focus:ring-2 focus:ring-polar-ink focus:ring-offset-2",
  {
    variants: {
      variant: {
        default: "border-transparent bg-polar-ink text-polar-white",
        secondary: "border-polar-border bg-polar-surface text-polar-ink-2",
        outline: "text-polar-ink border-polar-border bg-transparent",
        accent: "border-transparent bg-polar-pink text-white",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  }
)

export interface BadgeProps
  extends React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof badgeVariants> {}

function Badge({ className, variant, ...props }: BadgeProps) {
  return (
    <div className={cn(badgeVariants({ variant }), className)} {...props} />
  )
}

export { Badge, badgeVariants }
