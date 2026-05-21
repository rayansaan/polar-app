import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import { colors, spacing, typography, borderRadius } from '../theme';

interface SidebarProps {
  activeRoute: string;
  onNavigate: (route: string) => void;
}

const menuItems = [
  { key: 'Home', label: 'Actualité' },
  { key: 'Search', label: 'Recherche' },
  { key: 'Map', label: 'Carte' },
  { key: 'Profile', label: 'Profil' },
];

export const Sidebar: React.FC<SidebarProps> = ({ activeRoute, onNavigate }) => {
  return (
    <View style={styles.container}>
      <View style={styles.logoContainer}>
        <Text style={styles.logo}>POLAR</Text>
      </View>
      
      <View style={styles.menu}>
        {menuItems.map((item) => (
          <TouchableOpacity
            key={item.key}
            style={[
              styles.menuItem,
              activeRoute === item.key && styles.menuItemActive,
            ]}
            onPress={() => onNavigate(item.key)}
          >
            <Text
              style={[
                styles.menuLabel,
                activeRoute === item.key && styles.menuLabelActive,
              ]}
            >
              {item.label}
            </Text>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    width: 250,
    backgroundColor: colors.surface,
    borderRightWidth: 1,
    borderRightColor: colors.border,
    paddingTop: spacing.lg,
    paddingHorizontal: spacing.md,
  },
  logoContainer: {
    paddingBottom: spacing.xl,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
    marginBottom: spacing.lg,
  },
  logo: {
    ...typography.h2,
    color: colors.primary,
    letterSpacing: 4,
    fontWeight: '800',
  },
  menu: {
    gap: spacing.sm,
  },
  menuItem: {
    paddingVertical: spacing.md,
    paddingHorizontal: spacing.md,
    borderRadius: borderRadius.md,
  },
  menuItemActive: {
    backgroundColor: colors.primary,
  },
  menuLabel: {
    ...typography.body,
    color: colors.textSecondary,
  },
  menuLabelActive: {
    color: colors.text,
    fontWeight: '600',
  },
});

export default Sidebar;
