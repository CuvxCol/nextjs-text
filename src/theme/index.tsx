'use client';
import { ConfigProvider } from "antd";
import themeConfig from "@/theme/config";

function ThemeProvider({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <ConfigProvider theme={themeConfig}>
            {children}
        </ConfigProvider>
    )
}

export default ThemeProvider;