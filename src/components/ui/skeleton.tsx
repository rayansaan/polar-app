import React from 'react';

interface SkeletonProps {
  variant?: 'card' | 'article' | 'text' | 'hero';
  lines?: number;
  className?: string;
}

export const Skeleton: React.FC<SkeletonProps> = ({ 
  variant = 'card', 
  lines = 3,
  className = '' 
}) => {
  const baseClasses = 'animate-pulse bg-polar-surface border border-polar-border';
  
  if (variant === 'card') {
    return (
      <div className={`${baseClasses} ${className}`}>
        <div className="aspect-[2/3] bg-polar-white/50" />
        <div className="p-3 space-y-2">
          <div className="h-4 bg-polar-white/50 rounded w-3/4" />
          <div className="h-3 bg-polar-white/50 rounded w-1/2" />
        </div>
      </div>
    );
  }
  
  if (variant === 'article') {
    return (
      <div className={`flex gap-4 p-3 ${baseClasses} ${className}`}>
        <div className="flex-shrink-0 w-24 h-24 lg:w-32 lg:h-28 bg-polar-white/50" />
        <div className="flex-1 space-y-2 py-1">
          <div className="h-3 bg-polar-white/50 rounded w-20" />
          <div className="h-4 bg-polar-white/50 rounded w-full" />
          <div className="h-3 bg-polar-white/50 rounded w-5/6" />
          <div className="h-3 bg-polar-white/50 rounded w-16" />
        </div>
      </div>
    );
  }
  
  if (variant === 'text') {
    return (
      <div className={`space-y-2 ${className}`}>
        {Array.from({ length: lines }).map((_, i) => (
          <div 
            key={i} 
            className="h-3 bg-polar-surface rounded animate-pulse"
            style={{ width: `${85 - (i * 15)}%` }}
          />
        ))}
      </div>
    );
  }
  
  if (variant === 'hero') {
    return (
      <div className={`${baseClasses} ${className}`}>
        <div className="aspect-[3/4] lg:aspect-auto lg:h-full bg-polar-white/50" />
      </div>
    );
  }
  
  return null;
};

export default Skeleton;
