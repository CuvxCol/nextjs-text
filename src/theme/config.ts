import type { ThemeConfig } from 'antd';
import { theme } from 'antd';

const { defaultAlgorithm, darkAlgorithm, compactAlgorithm } = theme;

const themeConfig: ThemeConfig = {
  algorithm: [darkAlgorithm, compactAlgorithm],
};

export default themeConfig;
